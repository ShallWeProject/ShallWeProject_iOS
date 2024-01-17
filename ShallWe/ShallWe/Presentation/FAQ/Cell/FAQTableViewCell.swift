//
//  FAQTableViewCell.swift
//  ShallWe
//
//  Created by 김나연 on 1/18/24.
//

import UIKit

import SnapKit

final class FAQTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    
    
    // MARK: - View Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
    }
}
