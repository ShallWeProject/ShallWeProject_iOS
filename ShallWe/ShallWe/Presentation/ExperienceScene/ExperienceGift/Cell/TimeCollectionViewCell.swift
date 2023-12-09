//
//  TimeCollectionViewCell.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/09.
//

import UIKit

import SnapKit

final class TimeCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "13시"
        label.textColor = .gray4
        label.font = .fontGuide(.M00_14)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.gray0.cgColor
        label.layer.borderWidth = 1
        return label
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

extension TimeCollectionViewCell {
    func setHierarchy() {
        addSubview(timeLabel)
    }
    
    func setLayout() {
        timeLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
