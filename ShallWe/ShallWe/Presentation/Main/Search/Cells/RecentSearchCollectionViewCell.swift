//
//  RecentSearchCollectionViewCell.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit

final class RecentSearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let searchIconView = UIImageView()
    private let titleLabel = UILabel()
    private let deleteButton = UIButton()
    
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

extension RecentSearchCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        
        searchIconView.do {
            $0.image = ImageLiterals.Icon.search_colored
        }
        
        titleLabel.do {
            $0.font = .fontGuide(.R00_14)
            $0.textColor = .black
        }
        
        deleteButton.do {
            $0.setImage(ImageLiterals.Icon.delete, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.contentView.addSubviews(searchIconView, titleLabel, deleteButton)
        
        searchIconView.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchIconView.snp.trailing).offset(6)
            $0.width.equalTo(147)
            $0.height.equalTo(28)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}

extension RecentSearchCollectionViewCell {
    
    // MARK: - Methods
    
    func configureCell(_ model: RecentSearchModel) {
        titleLabel.text = model.title
    }
}
