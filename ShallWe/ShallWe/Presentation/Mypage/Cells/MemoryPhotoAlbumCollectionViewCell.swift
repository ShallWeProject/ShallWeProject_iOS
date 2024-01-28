//
//  MemoryPhotoAlbumCollectionViewCell.swift
//  ShallWe
//
//  Created by 김나연 on 1/28/24.
//

import UIKit

import SnapKit

final class MemoryPhotoAlbumCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - UI Components
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray0
        return imageView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MemoryPhotoAlbumCollectionViewCell {
    
    func setUI() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func setHierarchy() {
        self.addSubviews(imageView)
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(index: Int) {
        imageView.image = UIImage(named: "memory_ex")
    }
}
