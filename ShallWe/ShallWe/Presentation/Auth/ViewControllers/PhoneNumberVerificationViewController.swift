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
    }
    
    func setDelegate() {
        nameTextField.delegate = self
        phoneNumberTextField.delegate = self
        verificationCodeTextField.delegate = self
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
        phoneNumberVerificationView.isVerificationRequested = true
        phoneNumberVerificationView.verificationCodeTextField.isHidden = false
        phoneNumberVerificationView.checkButton.isHidden = false
        phoneNumberVerificationView.adjustPositionWhenTextFieldFocus()
    }
}

extension PhoneNumberVerificationViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        phoneNumberVerificationView.editingTextField = textField as? CustomTextFieldView
    }
}
