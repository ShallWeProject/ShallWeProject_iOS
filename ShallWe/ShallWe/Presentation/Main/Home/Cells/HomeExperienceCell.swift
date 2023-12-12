//
//  HomeExperienceCell.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import SnapKit
import Then

final class HomeExperienceCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    
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

extension HomeExperienceCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        imageView.do {
            $0.image = ImageLiterals.Home.img_ad2
            $0.makeCornerRound(radius: 10)
        }
        
        titleLabel.do {
            $0.font = .fontGuide(.B00_12)
            $0.textColor = .black
        }
        
        descriptionLabel.do {
            $0.font = .fontGuide(.M00_12)
            $0.textColor = .black
            $0.numberOfLines = 0
        }
        
        priceLabel.do {
            $0.font = .fontGuide(.EB00_14)
            $0.textColor = .point
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.contentView.addSubviews(imageView, titleLabel,
                                     descriptionLabel, priceLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 154 / 812)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.width.equalTo(156)
            $0.height.equalTo(32)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func configureCell(_ model: HomeExperienceModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        priceLabel.text = model.price
    }
}

