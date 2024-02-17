//
//  PhoneNumberVerificationView.swift
//  ShallWe
//
//  Created by 김나연 on 12/10/23.
//

import UIKit

import SnapKit

final class PhoneNumberVerificationView: UIView {
    
    // MARK: - Properties
    
    var scrollViewBottomConstraint: Constraint?
    var editingTextField: CustomTextFieldView?
    private var isVerificationRequested = false

    // MARK: - UI Components
    
    let scrollView: UIScrollView = {
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
    
    let requestButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.verificationRequestText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.M00_14)
        button.backgroundColor = .black0
        button.layer.cornerRadius = 10
        return button
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.checkText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.M00_14)
        button.backgroundColor = .black0
        button.layer.cornerRadius = 10
        button.isHidden = true
        return button
    }()
    
    private let authHeaderView = AuthHeaderView(frame: .zero, text: I18N.Auth.phoneNumberVerificationText)
    let nameTextField = CustomTextFieldView()
    let phoneNumberTextField = CustomTextFieldView(frame: .zero, placeholder: I18N.Auth.phoneNumberInputText)
    let verificationCodeTextField = CustomTextFieldView(frame: .zero, placeholder: I18N.Auth.verificationCodeInputText)
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension PhoneNumberVerificationView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
        verificationCodeTextField.isHidden = true
    }
    
    func setHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubviews(contentView, nextButton)
        contentView.addSubviews(authHeaderView, nameInputLabel, nameTextField, phoneNumberTextField, requestButton,  verificationCodeTextField, checkButton)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
            scrollViewBottomConstraint = $0.bottom.equalToSuperview().constraint
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
            $0.bottom.greaterThanOrEqualToSuperview().inset(50)
        }
    }
    
    /// TextField 포커스될 때 키보드에 가려지지 않도록 위치 조정
    private func adjustPositionWhenTextFieldFocus() {
        if isVerificationRequested, let editingTextField {
            switch editingTextField {
            case verificationCodeTextField:
                let distance = checkButton.frame.maxY - scrollView.frame.maxY + 40
                let offset = CGPoint(x: 0, y: scrollView.frame.origin.y + distance)
                scrollView.setContentOffset(offset, animated: true)
            case phoneNumberTextField:
                let distance = checkButton.frame.maxY - scrollView.frame.maxY + 16
                let offset = CGPoint(x: 0, y: scrollView.frame.origin.y + distance)
                scrollView.setContentOffset(offset, animated: true)
            default:
                return
            }
        }
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size else {
            return
        }
        nextButton.isHidden = true
        scrollViewBottomConstraint?.update(offset: -keyboardSize.height)
        layoutIfNeeded()
        adjustPositionWhenTextFieldFocus()
    }

    @objc
    func keyboardWillHide(_ notification: Notification) {
        scrollViewBottomConstraint?.update(offset: 0)
        nextButton.isHidden = false
    }
}
