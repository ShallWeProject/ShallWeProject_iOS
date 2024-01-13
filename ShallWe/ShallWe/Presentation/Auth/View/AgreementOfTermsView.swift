//
//  AgreementOfTermsView.swift
//  ShallWe
//
//  Created by 김나연 on 1/12/24.
//

import UIKit

import SnapKit

final class AgreementOfTermsView: UIView {
    
    // MARK: - UI Components
    
    private let agreeToAllButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.check_round_default, for: .normal)
        return button
    }()
    
    private let agreeToAllLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.totallyAgreeText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private let agreeToAllStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 7
        return stackView
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .line1
        return view
    }()
    
    private let age14OrOlderLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.age14OrOlderText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        let attributedStr = NSMutableAttributedString(string: label.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.point, range: (label.text! as NSString).range(of: I18N.Auth.requiredText))
        label.attributedText = attributedStr
        return label
    }()
    
    private let agreeToTermsOfServiceLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.agreeToTermsOfServiceText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        let attributedStr = NSMutableAttributedString(string: label.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.point, range: (label.text! as NSString).range(of: I18N.Auth.requiredText))
        label.attributedText = attributedStr
        return label
    }()
    
    private let agreeToCollectionAndUsePersonalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.agreeToCollectionAndUsePersonalInfoText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        let attributedStr = NSMutableAttributedString(string: label.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.point, range: (label.text! as NSString).range(of: I18N.Auth.requiredText))
        label.attributedText = attributedStr
        return label
    }()
    
    private let agreeToReceiveMarketingInfoLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.agreeToReceiveMarketingInfoText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        return label
    }()
    
    private let age14OrOlderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private let agreeToTermsOfServiceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private let agreeToCollectionAndUsePersonalInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private let agreeToReceiveMarketingInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private let viewTermsOfServiceButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.viewDetailsText, for: .normal)
        button.setTitleColor(.gray4, for: .normal)
        button.titleLabel?.setUnderlinePartFontChange(targetString: I18N.Auth.viewDetailsText, font: .fontGuide(.M00_12_underlined))
        return button
    }()
    
    private let viewCollectionAndUsePersonalInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.viewDetailsText, for: .normal)
        button.setTitleColor(.gray4, for: .normal)
        button.titleLabel?.setUnderlinePartFontChange(targetString: I18N.Auth.viewDetailsText, font: .fontGuide(.M00_12_underlined))
        return button
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
    
    private let authHeaderView = AuthHeaderView(frame: .zero, text: I18N.Auth.agreementToTermsText)
    private let age14OrOlderButton = CustomCheckbutton()
    private let agreeToTermsOfServiceButton = CustomCheckbutton()
    private let agreeToCollectionAndUsePersonalInfoButton = CustomCheckbutton()
    private let agreeToReceiveMarketingInfoButton = CustomCheckbutton()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension AgreementOfTermsView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(authHeaderView, agreeToAllStackView, divider, age14OrOlderStackView, agreeToTermsOfServiceStackView, agreeToCollectionAndUsePersonalInfoStackView, agreeToReceiveMarketingInfoStackView, viewTermsOfServiceButton, viewCollectionAndUsePersonalInfoButton, nextButton)
        agreeToAllStackView.addArrangedSubviews(agreeToAllButton, agreeToAllLabel)
        age14OrOlderStackView.addArrangedSubviews(age14OrOlderButton, age14OrOlderLabel)
        agreeToTermsOfServiceStackView.addArrangedSubviews(agreeToTermsOfServiceButton, agreeToTermsOfServiceLabel)
        agreeToCollectionAndUsePersonalInfoStackView.addArrangedSubviews(agreeToCollectionAndUsePersonalInfoButton, agreeToCollectionAndUsePersonalInfoLabel)
        agreeToReceiveMarketingInfoStackView.addArrangedSubviews(agreeToReceiveMarketingInfoButton, agreeToReceiveMarketingInfoLabel)
    }
    
    func setLayout() {
        authHeaderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(SizeLiterals.Screen.screenHeight*(64/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        agreeToAllStackView.snp.makeConstraints {
            $0.top.equalTo(authHeaderView.snp.bottom).offset(SizeLiterals.Screen.screenHeight*(43/768))
            $0.leading.equalToSuperview().inset(21)
        }
        
        divider.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(agreeToAllStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(27)
        }
        
        age14OrOlderStackView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
        }
        
        agreeToTermsOfServiceStackView.snp.makeConstraints {
            $0.top.equalTo(age14OrOlderStackView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }
        
        agreeToCollectionAndUsePersonalInfoStackView.snp.makeConstraints {
            $0.top.equalTo(agreeToTermsOfServiceStackView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }
        
        agreeToReceiveMarketingInfoStackView.snp.makeConstraints {
            $0.top.equalTo(agreeToCollectionAndUsePersonalInfoStackView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }
        
        viewTermsOfServiceButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.centerY.equalTo(agreeToTermsOfServiceStackView.snp.centerY)
        }
        
        viewCollectionAndUsePersonalInfoButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.centerY.equalTo(agreeToCollectionAndUsePersonalInfoStackView.snp.centerY)
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(49)
        }
    }
    
    func setAddTarget() {
    }
    
    // MARK: - Actions
    
}
