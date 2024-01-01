//
//  HomeRecommendCell.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import SnapKit
import Then

final class HomeRecommendCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let recommendImageView = UIImageView()
    
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

extension HomeRecommendCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.makeCornerRound(radius: 10)
        
        recommendImageView.do {
            $0.image = ImageLiterals.Home.img_birthday
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.contentView.addSubviews(recommendImageView)
        
        recommendImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func configureCell(_ model: RecommendModel) {
        recommendImageView.image = model.image
    }
}
