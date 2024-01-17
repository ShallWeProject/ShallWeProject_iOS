//
//  CustomNavigationBar.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import Then
import SnapKit

class CustomNavigationBar: BaseView {
    
    // MARK: - UI Components

    private lazy var logoView = UIImageView()
    lazy var backButton = UIButton()
    private lazy var closeButton = UIButton()
    
    // MARK: - Properties
    
    var isLogoViewIncluded: Bool {
        get { !logoView.isHidden }
        set { logoView.isHidden = !newValue }
    }
    
    var isBackButtonIncluded: Bool {
        get { !backButton.isHidden }
        set { backButton.isHidden = !newValue }
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        self.backgroundColor = .white
        
        logoView.do {
            $0.image = ImageLiterals.Home.logo_shallwe
            $0.isHidden = true
        }
        
        backButton.do {
            $0.setImage(ImageLiterals.Icon.arrow_left, for: .normal)
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        self.addSubviews(logoView, backButton)
        
        logoView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
    }
}
