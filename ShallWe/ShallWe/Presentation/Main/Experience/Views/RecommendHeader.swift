//
//  RecommendHeader.swift
//  ShallWe
//
//  Created by KJ on 12/24/23.
//

import UIKit

import SnapKit
import Then

final class RecommendHeader: UICollectionReusableView {
    
    // MARK: - UI Components
    
    let dropDownButton = UIButton()
    lazy var activateButtonView = UIView()
    lazy var mainButton = UIButton()
    lazy var subButton1 = UIButton()
    lazy var subButton2 = UIButton()
    lazy var subButton3 = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendHeader {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .white
        
        dropDownButton.do {
            $0.titleLabel?.font = .fontGuide(.M00_12)
            $0.setTitleColor(.black0, for: .normal)
            $0.set(image: ImageLiterals.Icon.arrow_down_small, withTitle: "인기순", forState: .normal)
            $0.backgroundColor = .bg2
            $0.makeCornerRound(radius: 12)
            $0.makeBorder(width: 0.8, color: .bg4)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.addSubviews(dropDownButton)
//        activateButtonView.addSubviews(mainButton, subButton1, subButton2, subButton3)
        
        dropDownButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(82)
            $0.height.equalTo(25)
        }
        
        
    }
    
    // MARK: - Methods
   
}
