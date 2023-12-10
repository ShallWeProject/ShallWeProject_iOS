//
//  PhoneNumberVerificationViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/6/23.
//

import UIKit

import SnapKit

final class PhoneNumberVerificationViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let authHeaderView = AuthHeaderView(frame: .zero, text: I18N.Auth.phoneNumberVerificationText)
    
    private let nameInputLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.nameInputText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private var nameTextField = CustomTextFieldView()
    private var phoneNumberTextField = CustomTextFieldView()
    private var verificationCodeTextField = CustomTextFieldView(frame: .zero, placeholder: I18N.Auth.verificationCodeInputText)
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions

extension PhoneNumberVerificationViewController {
    
    // MARK: - Methods
    
    func setUI() {
        view.backgroundColor = .white
    }
    
    func setHierarchy() {
        view.addSubviews(authHeaderView, nameInputLabel, nameTextField, phoneNumberTextField, verificationCodeTextField)
    }
    
    func setLayout() {
        authHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(SizeLiterals.Screen.screenHeight*(64/734))
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        nameInputLabel.snp.makeConstraints {
            $0.top.equalTo(authHeaderView.snp.bottom).offset(60)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        nameTextField.snp.makeConstraints {
            $0.width.equalTo(128)
            $0.top.equalTo(nameInputLabel.snp.bottom).offset(15)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.width.equalTo(SizeLiterals.Screen.screenWidth*(212/375))
            $0.top.equalTo(nameTextField.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        verificationCodeTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
}
