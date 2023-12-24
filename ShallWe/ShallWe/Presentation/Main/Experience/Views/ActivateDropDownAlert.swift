//
//  ActivateDropDownAlert.swift
//  ShallWe
//
//  Created by KJ on 12/24/23.
//

import UIKit

import Then
import SnapKit

final class ActivateDropDownAlert: BaseView {

    // MARK: - UI Components
    
    lazy var contentView = UIView()
    lazy var mainButton = UIButton()
    lazy var subButton1 = UIButton()
    lazy var subButton2 = UIButton()
    lazy var subButton3 = UIButton()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
        contentView.do {
            $0.backgroundColor = .clear
            $0.makeCornerRound(radius: 12)
        }
        
        mainButton.do {
            $0.titleLabel?.font = .fontGuide(.M00_12)
            $0.setTitleColor(.black0, for: .normal)
            $0.set(image: ImageLiterals.Icon.arrow_up, withTitle: "인기순", forState: .normal)
            $0.backgroundColor = .bg2
            $0.makeBorder(width: 0.8, color: .bg4)
        }
        
        subButton1.do {
            $0.titleLabel?.font = .fontGuide(.R00_10)
            $0.setTitleColor(.black0, for: .normal)
            $0.backgroundColor = .bg2
            $0.makeBorder(width: 0.5, color: .bg4)
            $0.setTitle("추천순", for: .normal)
        }
        
        subButton2.do {
            $0.titleLabel?.font = .fontGuide(.R00_10)
            $0.setTitleColor(.black0, for: .normal)
            $0.backgroundColor = .bg2
            $0.makeBorder(width: 0.5, color: .bg4)
            $0.setTitle("추천순", for: .normal)
        }
        
        subButton3.do {
            $0.titleLabel?.font = .fontGuide(.R00_10)
            $0.setTitleColor(.black0, for: .normal)
            $0.backgroundColor = .bg2
            $0.makeBorder(width: 0.5, color: .bg4)
            $0.setTitle("추천순", for: .normal)
        }
    }

    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.addSubviews(contentView)
        contentView.addSubviews(mainButton, subButton1, subButton2, subButton3)
        
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(148)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(82)
            $0.height.equalTo(88)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(25)
        }
        
        subButton1.snp.makeConstraints {
            $0.top.equalTo(mainButton.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        subButton2.snp.makeConstraints {
            $0.top.equalTo(subButton1.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        subButton3.snp.makeConstraints {
            $0.top.equalTo(subButton2.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(20)
        }
    }
}
