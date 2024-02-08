//
//  SortHalfModalCell.swift
//  ShallWe
//
//  Created by KJ on 1/15/24.
//

import UIKit

import Then
import SnapKit

final class SortHalfModalCell: UITableViewCell {

    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    
    // MARK: - Properties
    
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                titleLabel.font = .fontGuide(.B00_14)
//                titleLabel.textColor = .black0
//            } else {
//                titleLabel.font = .fontGuide(.M00_14)
//                titleLabel.textColor = .gray3
//            }
//        }
//    }
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SortHalfModalCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .bg0
        contentView.backgroundColor = .clear
        
        titleLabel.do {
            $0.textColor = .black0
            $0.font = .fontGuide(.M00_14)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Methods

    func configureCell(_ model: SortModel) {
        titleLabel.text = model.title
    }
}
