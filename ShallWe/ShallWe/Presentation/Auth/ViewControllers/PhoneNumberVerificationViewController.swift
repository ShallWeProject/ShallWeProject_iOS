//
//  PhoneNumberVerificationViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/6/23.
//

import UIKit

import RxCocoa
import RxSwift
import RxKeyboard

protocol SignUpVC {
    func changeNextButtonToPink()
    func changeNextButtonToGray()
}

final class PhoneNumberVerificationViewController: BaseViewController, SignUpVC {
    
    // MARK: - Properties
    
    private let authViewModel: AuthViewModel
    private var timer : Timer?
    private var verificationValidSec = 180 - 1
    private let disposeBag = DisposeBag()
    private var editingTextField: CustomTextFieldView?
    
    // MARK: - UI Components
    
    private let phoneNumberVerificationView = PhoneNumberVerificationView()
    private lazy var nameTextField = phoneNumberVerificationView.nameTextField
    private lazy var phoneNumberTextField = phoneNumberVerificationView.phoneNumberTextField
    private lazy var verificationCodeTextField = phoneNumberVerificationView.verificationCodeTextField
    private lazy var verificationValidTime = phoneNumberVerificationView.verificationValidTime
    private lazy var nextButton = phoneNumberVerificationView.nextButton
    private lazy var requestButton = phoneNumberVerificationView.requestButton
    private lazy var checkButton = phoneNumberVerificationView.checkButton
    
    // MARK: - Life Cycles
    
    init(viewModel: AuthViewModel) {
        self.authViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = phoneNumberVerificationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setAddTarget()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Methods
    
    override func bindViewModel() {
        nameTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .filter {
                ($0.isEmpty && self.nameTextField.backgroundColor == .bg2) || (!$0.isEmpty && self.nameTextField.backgroundColor == .gray0)
            }
            .map {
                if $0.isEmpty {
                    self.nameTextField.changeToGray()
                    return InputStatus.empty
                } else {
                    self.nameTextField.changeToPink()
                    return InputStatus.entered
                }
            }
            .bind(to: authViewModel.input.nameTextFieldDidChange)
            .disposed(by: disposeBag)

        phoneNumberTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .filter {
                ($0.isEmpty && self.phoneNumberTextField.backgroundColor == .bg2) || (!$0.isEmpty && self.phoneNumberTextField.backgroundColor == .gray0)
            }
            .map {
                if $0.isEmpty {
                    self.phoneNumberTextField.changeToGray()
                    return InputStatus.empty
                } else {
                    self.phoneNumberTextField.changeToPink()
                    return InputStatus.entered
                }
            }
            .bind(to: authViewModel.input.phoneNumberTextFieldDidChange)
            .disposed(by: disposeBag)
        
        authViewModel.output.isAllEntered
            .drive(onNext: { [weak self] isAllEntered in
                if isAllEntered {
                    self?.changeNextButtonToPink()
                } else {
                    self?.changeNextButtonToGray()
                }
            })
            .disposed(by: disposeBag)
        
        verificationCodeTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .observe(on: MainScheduler.asyncInstance)
            .map(checkAndTrimText(_:))
            .subscribe(onNext: { [weak self] isFull in
                if isFull {
                    self?.verificationCodeTextField.resignFirstResponder()
                }
            })
            .disposed(by: disposeBag)
        
        phoneNumberTextField.rx.controlEvent(.editingDidBegin)
            .subscribe(onNext: {
                self.editingTextField = self.phoneNumberTextField
                self.phoneNumberVerificationView.adjustPositionWhenTextFieldIsFocused(textField: self.editingTextField)
            })
            .disposed(by: disposeBag)
        
        verificationCodeTextField.rx.controlEvent(.editingDidBegin)
            .subscribe(onNext: {
                self.editingTextField = self.verificationCodeTextField
                self.phoneNumberVerificationView.adjustPositionWhenTextFieldIsFocused(textField: self.editingTextField)
            })
            .disposed(by: disposeBag)
        
        RxKeyboard.instance.visibleHeight
            .skip(1)
            .drive(onNext: { [weak self] keyboardVisibleHeight in
                if keyboardVisibleHeight != 0 {
                    self?.nextButton.isHidden = true
                    self?.phoneNumberVerificationView.scrollViewBottomConstraint?.update(offset: -keyboardVisibleHeight)
                    self?.phoneNumberVerificationView.layoutIfNeeded()
                    self?.phoneNumberVerificationView.adjustPositionWhenTextFieldIsFocused(textField: self?.editingTextField)
                } else {
                    self?.phoneNumberVerificationView.scrollViewBottomConstraint?.update(offset: 0)
                    self?.nextButton.isHidden = false
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func checkAndTrimText(_ text: String) -> Bool {
        if text.count == 6 {
            return true
        }
        else if text.count > 6 {
            let index = text.index(text.startIndex, offsetBy: 6)
            self.verificationCodeTextField.text = String(text[..<index])
            
            return true
        }
        return false
    }
}

// MARK: - Extensions

extension PhoneNumberVerificationViewController {
    
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Icon.arrow_left,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonDidTap))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func setAddTarget() {
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        requestButton.addTarget(self, action: #selector(requestButtonDidTap), for: .touchUpInside)
        checkButton.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
    }
    
    func changeNextButtonToPink() {
        nextButton.isEnabled = true
        nextButton.backgroundColor = .point
    }
    
    func changeNextButtonToGray() {
        nextButton.isEnabled = false
        nextButton.backgroundColor = .gray2
    }
    
    func startTimer() {
        if let timer, timer.isValid {
            timer.invalidate()
        }
        verificationValidTime.text = ""
        verificationValidTime.isHidden = false
        verificationValidSec = 180 - 1
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.verificationValidSec == -1 {
                self.makeAlert(message: I18N.AuthAlert.timeoutText)
                self.verificationValidTime.isHidden = true
                timer.invalidate()
                return
            }
            let second = self.verificationValidSec % 60
            let secondString = (second > 9) ? "\(second)" : ("0\(second)")
            self.verificationValidTime.text = "0\(self.verificationValidSec/60):\(secondString)"
         
            self.verificationValidSec -= 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Actions
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func nextButtonDidTap() {
        let agreementToTermsViewController = AgreementToTermsViewController()
        self.navigationController?.pushViewController(agreementToTermsViewController, animated: true)
    }
    
    @objc
    func requestButtonDidTap() {
        // TODO: 전화번호 형식대로 입력 했는지 확인 후 서버에 요청
        if verificationCodeTextField.isHidden {
            verificationCodeTextField.isHidden = false
            checkButton.isHidden = false
        }
        startTimer()
        makeAlert(message: I18N.AuthAlert.codeSentText)
    }
    
    @objc
    func checkButtonDidTap() {
        if let timer, timer.isValid, verificationValidSec > -1, !verificationCodeTextField.text!.isEmpty {
            stopTimer()
            phoneNumberVerificationView.verificationValidTime.text = I18N.Auth.verificationSuccessText
            requestButton.isEnabled = false
            checkButton.isEnabled = false
            verificationCodeTextField.isEnabled = false
            verificationCodeTextField.changeToPink()
            authViewModel.input.isVerificationCompleted
                .accept(true)
        }
    }
}
