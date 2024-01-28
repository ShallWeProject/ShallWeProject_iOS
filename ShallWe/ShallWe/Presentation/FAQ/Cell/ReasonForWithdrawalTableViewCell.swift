//
//  ReasonForWithdrawalTableViewCell.swift
//  ShallWe
//
//  Created by 김나연 on 1/26/24.
//

import UIKit

import SnapKit

final class ReasonForWithdrawalTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        return label
    }()
    
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

extension ReasonForWithdrawalTableViewCell {
    private func setUI() {
        backgroundColor = .white
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.contentView.addSubviews(label)
        
        label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(21)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func configure(index: Int) {
        let description = ReasonForWithdrawal.init(rawValue: index)?.getDescription()
        label.text = description
        layoutIfNeeded()
    }
}
