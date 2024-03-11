//
//  CustomNavigationBar.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import Then
import SnapKit

protocol NavigationBarProtocol {
    func backButtonTapped()
}

class CustomNavigationBar: BaseView {
    
    // MARK: - UI Components

    private lazy var logoView = UIImageView()
    private lazy var faqView = UIImageView()
    lazy var backButton = UIButton()
    lazy var closeButton = UIButton()
    private lazy var titleLabel = UILabel()

    // MARK: - Properties
    
    var delegate: NavigationBarProtocol?
    
    var isLogoViewIncluded: Bool {
        get { !logoView.isHidden }
        set { logoView.isHidden = !newValue }
    }
    
    var isFAQViewIncluded: Bool {
        get { !faqView.isHidden }
        set { faqView.isHidden = !newValue }
    }
    
    var isBackButtonIncluded: Bool {
        get { !backButton.isHidden }
        set { backButton.isHidden = !newValue }
    }
    
    var isTitleLabelIncluded: Bool {
        get { !titleLabel.isHidden }
        set { titleLabel.isHidden = !newValue }
    }
    
    var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        self.backgroundColor = .white
        
        logoView.do {
            $0.image = ImageLiterals.Home.logo_shallwe
            $0.isHidden = true
        }
        
        faqView.do {
            $0.image = ImageLiterals.FAQ.img_faq
            $0.isHidden = true
        }
        
        backButton.do {
            $0.setImage(ImageLiterals.Icon.arrow_left, for: .normal)
            $0.isHidden = true
        }
        
        titleLabel.do {
            $0.font = .fontGuide(.SB00_16)
            $0.textColor = .black0
            $0.textAlignment = .center
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        self.addSubviews(logoView, faqView, backButton, titleLabel)
        
        logoView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        faqView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
    }
    
    override func setAddTarget() {
        backButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

extension CustomNavigationBar {
    
    @objc
    func buttonTapped() {
        delegate?.backButtonTapped()
    }
}
