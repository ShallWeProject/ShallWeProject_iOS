//
//  RecommendHeader.swift
//  ShallWe
//
//  Created by KJ on 12/24/23.
//

import UIKit

import SnapKit
import Then

enum DropDownTitleType {
    case popular
    case recommend
    case priceMax
    case priceMin
}

final class ExperienceHeader: UICollectionReusableView {
    
    // MARK: - UI Components
    
    let sortButton = UIButton()
    
    // MARK: - Properties
    
    var titleType: DropDownTitleType = .popular
    var sortButtonTapHandler: (() -> Void)?
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExperienceHeader {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .white
        
        sortButton.do {
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
        
        self.addSubviews(sortButton)
        
        sortButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(82)
            $0.height.equalTo(25)
        }
    }
    
    // MARK: - Methods
    
    func setButtonTitle(_ type: IndexPath) {
        switch type.row {
        case 0:
            sortButton.setTitle("인기순", for: .normal)
        case 1:
            sortButton.setTitle("추천순", for: .normal)
        case 2:
            sortButton.setTitle("가격높은순", for: .normal)
        case 3:
            sortButton.setTitle("가격낮은순", for: .normal)
        default:
            return
        }
    }
}
