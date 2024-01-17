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

extension FAQTableViewCell {
    private func setUI() {
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    func configure(index: Int, type: FlowType? = nil) {
        // StringLiterals에서 인덱스대로 텍스트 가져오고
        // FlowType으로 예약변경/계정설정 부분만 버튼(밑줄) 처리해서 탭하면 VC 이동
    }
}
