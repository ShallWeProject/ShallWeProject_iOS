//
//  PhoneNumberVerificationViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/6/23.
//

import UIKit

final class PhoneNumberVerificationViewController: UIViewController {
    
    // MARK: - Properties
    
    private let authViewModel: AuthViewModel
    private var timer : Timer?
    
    // MARK: - UI Components
    
    private let phoneNumberVerificationView = PhoneNumberVerificationView()
    private lazy var nameTextField = phoneNumberVerificationView.nameTextField
    private lazy var phoneNumberTextField = phoneNumberVerificationView.phoneNumberTextField
    private lazy var verificationCodeTextField = phoneNumberVerificationView.verificationCodeTextField
    
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
}

// MARK: - Extensions

extension PhoneNumberVerificationViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Icon.arrow_left,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonDidTap))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func setAddTarget() {
        phoneNumberVerificationView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        phoneNumberVerificationView.requestButton.addTarget(self, action: #selector(requestButtonDidTap), for: .touchUpInside)
        phoneNumberVerificationView.checkButton.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
    }
    
    func setDelegate() {
        nameTextField.delegate = self
        phoneNumberTextField.delegate = self
        verificationCodeTextField.delegate = self
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
        // TODO: timer.isVaild, 인증시간 유효한지 확인(-1보다 큰지)
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
