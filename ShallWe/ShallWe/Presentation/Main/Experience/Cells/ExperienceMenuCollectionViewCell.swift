//
//  ExperienceMenuCollectionViewCell.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

import Then
import SnapKit

final class ExperienceMenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    let underLine = UIView()
    
    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            underLine.isHidden = !isSelected
            if isSelected {
                self.selectedCell()
            } else {
                self.unSelectedCell()
            }
        }
    }
    
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

extension ExperienceMenuCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        
        titleLabel.do {
            $0.font = .fontGuide(.M00_14)
            $0.textColor = .gray3
        }
        
        underLine.do {
            $0.backgroundColor = .main
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.addSubviews(titleLabel, underLine)
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        underLine.snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.height.equalTo(2)
            $0.width.equalTo(35)
        }
    }
    
    // MARK: - Methods
    
    func configureCell(_ model: ExperienceType) {
        titleLabel.text = model.type
    }
    
    func setUnderLineWidth(size: Int) {
        underLine.snp.updateConstraints {
            $0.width.equalTo(size + 10)
        }
    }
    
    private func selectedCell() {
        titleLabel.font = .fontGuide(.SB00_14)
        titleLabel.textColor = .main
    }
    
    private func unSelectedCell() {
        titleLabel.font = .fontGuide(.M00_14)
        titleLabel.textColor = .gray3
    }
}
