//
//  PhoneNumberVerificationView.swift
//  ShallWe
//
//  Created by 김나연 on 12/10/23.
//

import UIKit

import SnapKit

final class PhoneNumberVerificationView: UIView {
    
    // MARK: - UI Components
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.nextText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .gray2
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let nameInputLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.nameInputText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private let requestButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.verificationRequestText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.M00_14)
        button.backgroundColor = .black0
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.checkText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.M00_14)
        button.backgroundColor = .black0
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let authHeaderView = AuthHeaderView(frame: .zero, text: I18N.Auth.phoneNumberVerificationText)
    private var nameTextField = CustomTextFieldView()
    private var phoneNumberTextField = CustomTextFieldView(frame: .zero, placeholder: I18N.Auth.phoneNumberInputText)
    private var verificationCodeTextField = CustomTextFieldView(frame: .zero, placeholder: I18N.Auth.verificationCodeInputText)
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension PhoneNumberVerificationView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubviews(contentView, nextButton)
        contentView.addSubviews(authHeaderView, nameInputLabel, nameTextField, phoneNumberTextField, requestButton,  verificationCodeTextField, checkButton)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide).inset(20)
            $0.bottom.equalTo(scrollView.frameLayoutGuide).inset(49)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        authHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(SizeLiterals.Screen.screenHeight*(64/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        nameInputLabel.snp.makeConstraints {
            $0.top.equalTo(authHeaderView.snp.bottom).offset(SizeLiterals.Screen.screenHeight*(59/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        nameTextField.snp.makeConstraints {
            $0.width.equalTo(128)
            $0.top.equalTo(nameInputLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(24)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.width.equalTo(SizeLiterals.Screen.screenWidth*(212/375))
            $0.top.equalTo(nameTextField.snp.bottom).offset(SizeLiterals.Screen.screenHeight*(40/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        verificationCodeTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        requestButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.leading.equalTo(phoneNumberTextField.snp.trailing).offset(13)
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalTo(phoneNumberTextField.snp.centerY)
        }
        
        checkButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(verificationCodeTextField.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.greaterThanOrEqualToSuperview().inset(30)
        }
    }
}
