//
//  PhoneNumberVerificationViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/6/23.
//

import UIKit

import RxCocoa
import RxSwift

protocol SignUpVC {
    func changeNextButtonToPink()
    func changeNextButtonToGray()
}

final class PhoneNumberVerificationViewController: BaseViewController, SignUpVC {
    
    // MARK: - Properties
    
    private let authViewModel: AuthViewModel
    private var timer : Timer?
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let phoneNumberVerificationView = PhoneNumberVerificationView()
    private lazy var nameTextField = phoneNumberVerificationView.nameTextField
    private lazy var phoneNumberTextField = phoneNumberVerificationView.phoneNumberTextField
    private lazy var verificationCodeTextField = phoneNumberVerificationView.verificationCodeTextField
    private lazy var nextButton = phoneNumberVerificationView.nextButton
    
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
        setDelegate()
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
            .subscribe(onNext: { newValue in
                if newValue.isEmpty {
                    self.nameTextField.changeToGray()
                    self.authViewModel.textFieldInputStateDidChange(state: .empty)
                }
                else {
                    self.nameTextField.changeToPink()
                    self.authViewModel.textFieldInputStateDidChange(state: .entered)
                }
            })
            .disposed(by: disposeBag)
        
        phoneNumberTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .filter {
                ($0.isEmpty && self.phoneNumberTextField.backgroundColor == .bg2) || (!$0.isEmpty && self.phoneNumberTextField.backgroundColor == .gray0)
            }
            .subscribe(onNext: { newValue in
                if newValue.isEmpty {
                    self.phoneNumberTextField.changeToGray()
                    self.authViewModel.textFieldInputStateDidChange(state: .empty)
                }
                else {
                    self.phoneNumberTextField.changeToPink()
                    self.authViewModel.textFieldInputStateDidChange(state: .entered)
                }
            })
            .disposed(by: disposeBag)
        
//        verificationCodeTextField.rx.text
//            .orEmpty
//            .distinctUntilChanged()
//            .filter {
//                
//            }
//            .subscribe(onNext: { newValue in
//                // 글자수제한
//            })
//            .disposed(by: disposeBag)
        
        authViewModel.outputs.inputStatus
            .subscribe(onNext: { [weak self] state in
                guard let self = self else { return }
                switch state {
                case .entered:
                    if checkIfAllTextFieldsArdEntered() {
                        self.changeNextButtonToPink()
                    }
                case .empty:
                    self.changeNextButtonToGray()
                default:
                    return
                }
            })
            .disposed(by: disposeBag)
    }
    
    override func setDelegate() {
        nameTextField.delegate = self
        phoneNumberTextField.delegate = self
        verificationCodeTextField.delegate = self
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
        phoneNumberVerificationView.requestButton.addTarget(self, action: #selector(requestButtonDidTap), for: .touchUpInside)
        phoneNumberVerificationView.checkButton.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
    }
    
    func changeNextButtonToPink() {
        phoneNumberVerificationView.nextButton.isEnabled = true
        phoneNumberVerificationView.nextButton.backgroundColor = .point
    }
    
    func changeNextButtonToGray() {
        phoneNumberVerificationView.nextButton.isEnabled = false
        phoneNumberVerificationView.nextButton.backgroundColor = .gray2
    }
    
    func checkIfAllTextFieldsArdEntered() -> Bool {
        if !nameTextField.isEmpty, !phoneNumberTextField.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func startTimer() {
        if let timer, timer.isValid {
            timer.invalidate()
        }
        phoneNumberVerificationView.verificationValidTime.text = ""
        phoneNumberVerificationView.verificationValidTime.isHidden = false
        var verificationValidSec = 180 - 1
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if verificationValidSec == -1 {
                self.makeAlert(message: I18N.AuthAlert.timeoutText)
                self.phoneNumberVerificationView.verificationValidTime.isHidden = true
                timer.invalidate()
                return
            }
            let second = verificationValidSec % 60
            let secondString = (second > 9) ? "\(second)" : ("0\(second)")
            self.phoneNumberVerificationView.verificationValidTime.text = "0\(verificationValidSec/60):\(secondString)"
         
            verificationValidSec -= 1
        }
    }
    
    // MARK: Actions
    
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
        if phoneNumberVerificationView.verificationCodeTextField.isHidden {
            phoneNumberVerificationView.verificationCodeTextField.isHidden = false
            phoneNumberVerificationView.checkButton.isHidden = false
            phoneNumberVerificationView.adjustPositionWhenTextFieldFocus()
        }
        startTimer()
        makeAlert(message: I18N.AuthAlert.codeSentText)
    }
    
    @objc
    func checkButtonDidTap() {
        // TODO: timer.isVaild, 인증시간 유효한지 확인(-1보다 큰지) => 인증성공 시 '인증 완료'로 verificationValidTime.text 변경, changeToPink(), textField 비활성화 상태로 변경
    }
}

extension PhoneNumberVerificationViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        phoneNumberVerificationView.editingTextField = textField as? CustomTextFieldView
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
