//
//  AgreementOfTermsView.swift
//  ShallWe
//
//  Created by 김나연 on 1/12/24.
//

import UIKit

import SnapKit

final class AgreementOfTermsView: UIView {
    
    // MARK: - Properties
    
    lazy private var agreeButtons = [age14OrOlderButton, agreeToTermsOfServiceButton, agreeToCollectionAndUsePersonalInfoButton, agreeToReceiveMarketingInfoButton]
    private var statusOfAgreement = Array.init(repeating: false, count: 4)
    
    // MARK: - UI Components
    
    private let agreeToAllButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(I18N.Auth.totallyAgreeText, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.SB00_16)]))
        configuration.baseForegroundColor = .black0
        configuration.image = ImageLiterals.Icon.check_round_default
        configuration.imagePadding = 7
        configuration.contentInsets = NSDirectionalEdgeInsets.zero
        return UIButton(configuration: configuration)
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .line1
        return view
    }()
    
    private let age14OrOlderButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black0
        var attributedString = AttributedString(I18N.Auth.age14OrOlderText)
        let range = attributedString.range(of: I18N.Auth.requiredText)!
        attributedString[range].foregroundColor = .point
        attributedString.mergeAttributes(AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.M00_14)]))
        configuration.attributedTitle = attributedString
        configuration.image = ImageLiterals.Icon.check_default
        configuration.imagePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets.zero
        return UIButton(configuration: configuration)
    }()
    
    private let agreeToTermsOfServiceButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black0
        var attributedString = AttributedString(I18N.Auth.agreeToTermsOfServiceText)
        let range = attributedString.range(of: I18N.Auth.requiredText)!
        attributedString[range].foregroundColor = .point
        attributedString.mergeAttributes(AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.M00_14)]))
        configuration.attributedTitle = attributedString
        configuration.image = ImageLiterals.Icon.check_default
        configuration.imagePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets.zero
        return UIButton(configuration: configuration)
    }()
    
    private let agreeToCollectionAndUsePersonalInfoButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black0
        var attributedString = AttributedString(I18N.Auth.agreeToCollectionAndUsePersonalInfoText)
        let range = attributedString.range(of: I18N.Auth.requiredText)!
        attributedString[range].foregroundColor = .point
        attributedString.mergeAttributes(AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.M00_14)]))
        configuration.attributedTitle = attributedString
        configuration.image = ImageLiterals.Icon.check_default
        configuration.imagePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets.zero
        return UIButton(configuration: configuration)
    }()
    
    private let agreeToReceiveMarketingInfoButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(I18N.Auth.agreeToReceiveMarketingInfoText, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.M00_14)]))
        configuration.baseForegroundColor = .black0
        configuration.image = ImageLiterals.Icon.check_default
        configuration.imagePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets.zero
        return UIButton(configuration: configuration)
    }()
    
    let viewTermsOfServiceButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.viewDetailsText, for: .normal)
        button.setTitleColor(.gray4, for: .normal)
        button.titleLabel?.setUnderlinePartFontChange(targetString: I18N.Auth.viewDetailsText, font: .fontGuide(.M00_12_underlined))
        return button
    }()
    
    let viewCollectionAndUsePersonalInfoButton: UIButton = {
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
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setTag()
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
        self.addSubviews(authHeaderView, agreeToAllButton, divider, age14OrOlderButton, agreeToTermsOfServiceButton, agreeToCollectionAndUsePersonalInfoButton, agreeToReceiveMarketingInfoButton, viewTermsOfServiceButton, viewCollectionAndUsePersonalInfoButton, nextButton)
    }
    
    func setLayout() {
        authHeaderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(SizeLiterals.Screen.screenHeight*(64/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        agreeToAllButton.snp.makeConstraints {
            $0.top.equalTo(authHeaderView.snp.bottom).offset(SizeLiterals.Screen.screenHeight*(43/768))
            $0.leading.equalToSuperview().inset(21)
        }
        
        divider.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(agreeToAllButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(27)
        }
        
        age14OrOlderButton.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
        }
        
        agreeToTermsOfServiceButton.snp.makeConstraints {
            $0.top.equalTo(age14OrOlderButton.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }
        
        agreeToCollectionAndUsePersonalInfoButton.snp.makeConstraints {
            $0.top.equalTo(agreeToTermsOfServiceButton.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }
        
        agreeToReceiveMarketingInfoButton.snp.makeConstraints {
            $0.top.equalTo(agreeToCollectionAndUsePersonalInfoButton.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }
        
        viewTermsOfServiceButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.centerY.equalTo(agreeToTermsOfServiceButton.snp.centerY)
        }
        
        viewCollectionAndUsePersonalInfoButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.centerY.equalTo(agreeToCollectionAndUsePersonalInfoButton.snp.centerY)
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(49)
        }
    }
    
    func setTag() {
        age14OrOlderButton.tag = 0
        agreeToTermsOfServiceButton.tag = 1
        agreeToCollectionAndUsePersonalInfoButton.tag = 2
        agreeToReceiveMarketingInfoButton.tag = 3
    }
    
    func setAddTarget() {
        agreeToAllButton.addTarget(self, action: #selector(agreeToAllButtonDidTap), for: .touchUpInside)
        
        let buttons = [age14OrOlderButton, agreeToTermsOfServiceButton, agreeToCollectionAndUsePersonalInfoButton, agreeToReceiveMarketingInfoButton]
        for i in buttons.indices {
            buttons[i].addTarget(self, action: #selector(agreeWithOneButtonDidTap(_:)), for: .touchUpInside)
        }
    }
    
    // MARK: - Actions
    
    @objc func agreeToAllButtonDidTap() {
        if statusOfAgreement.allSatisfy({$0}) {
            statusOfAgreement = Array.init(repeating: false, count: 4)
            agreeToAllButton.setImage(ImageLiterals.Icon.check_round_default, for: .normal)
        } else {
            statusOfAgreement = Array.init(repeating: true, count: 4)
            agreeToAllButton.setImage(ImageLiterals.Icon.check_round_activated, for: .normal)
        }
        changeAllIconState()
    }
    
    @objc func agreeWithOneButtonDidTap(_ sender: UIButton) {
        let index = sender.tag
        statusOfAgreement[index] = !statusOfAgreement[index]
        changeOneIconState(index: index)
    }
    
    func changeAllIconState() {
        for i in 0..<4 {
            if statusOfAgreement[i] {
                agreeButtons[i].setImage(ImageLiterals.Icon.check_activated, for: .normal)
            } else {
                agreeButtons[i].setImage(ImageLiterals.Icon.check_default, for: .normal)
            }
        }
    }
    
    func changeOneIconState(index: Int) {
        if statusOfAgreement[index] {
            agreeButtons[index].setImage(ImageLiterals.Icon.check_activated, for: .normal)
        } else {
            agreeButtons[index].setImage(ImageLiterals.Icon.check_default, for: .normal)
        }
        
        if statusOfAgreement.allSatisfy({$0}) {
            agreeToAllButton.setImage(ImageLiterals.Icon.check_round_activated, for: .normal)
        } else {
            agreeToAllButton.setImage(ImageLiterals.Icon.check_round_default, for: .normal)
        }
    }
}
