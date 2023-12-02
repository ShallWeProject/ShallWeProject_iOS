//
//  HomePopularCategoryCell.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import SnapKit
import Then

final class HomePopularCategoryCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    
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

extension HomePopularCategoryCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.makeBorder(width: 1, color: .gray0)
        self.makeCornerRound(radius: 13)
        
        titleLabel.do {
            $0.text = "전체"
            $0.font = .fontGuide(.M00_12)
            $0.textColor = .gray4
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.contentView.addSubviews(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func configureCell(_ model: PopularCategoryModel) {
        titleLabel.text = model.title
    }
}
