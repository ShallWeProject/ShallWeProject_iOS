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
        return imageView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.plus_circle, for: .normal)
        button.backgroundColor = .gray0
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MemoryPhotoAlbumCollectionViewCell {
    
    func setUI() {
        self.backgroundColor = .gray0
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func setImageViewLayout() {
        self.addSubviews(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setAddButtonLayout() {
        self.addSubviews(addButton)
        addButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(index: Int) {
        if index == 0 {
            setAddButtonLayout()
        } else {
            setImageViewLayout()
            imageView.image = UIImage(named: "memory_ex")
        }
    }
}
