//
//  ExperienceImageCollectionViewCell.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/02.
//

import UIKit

import SnapKit
import Kingfisher

final class ExperienceImageCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ExperienceImageCollectionViewCell {
    
    func setHierarchy() {
        addSubview(imageView)
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ExperienceImageCollectionViewCell{
    
    func configureCell(img: String) {
        imageView.kf.setImage(with: URL(string: img))
    }
}
