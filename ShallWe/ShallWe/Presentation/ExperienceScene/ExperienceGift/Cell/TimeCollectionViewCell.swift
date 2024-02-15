//
//  TimeCollectionViewCell.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/31.
//

import UIKit

import SnapKit

final class TimeCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray4
        label.font = .fontGuide(.M00_14)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.gray0.cgColor
        label.layer.borderWidth = 1
        label.backgroundColor = .white
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

private extension TimeCollectionViewCell {
    
    func setHierarchy() {
        addSubview(timeLabel)
    }
    
    func setLayout() {
        timeLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TimeCollectionViewCell {
    
    func configureCell(model: ReservationDateDto) {
        let timeString = model.time
        let components = timeString.components(separatedBy: ":")
        if let hour = components.first {
            timeLabel.text = "\(hour)시"
        }
    }
}
