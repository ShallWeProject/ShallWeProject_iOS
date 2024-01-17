//
//  HomeGalleryCell.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import SnapKit
import Then

final class HomeGalleryCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let galleryImage = UIImageView()
    
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

extension HomeGalleryCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        galleryImage.do {
            $0.contentMode = .scaleToFill
            $0.image = ImageLiterals.Home.img_ad1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.contentView.addSubviews(galleryImage)
        
        galleryImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func configureCell(_ model: GalleryModel) {
        galleryImage.image = model.image
    }
}
