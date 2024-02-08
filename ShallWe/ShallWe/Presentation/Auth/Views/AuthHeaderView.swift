//
//  AuthHeaderView.swift
//  ShallWe
//
//  Created by 김나연 on 12/6/23.
//

import UIKit

import SnapKit

final class AuthHeaderView: UIView {
    
    // MARK: - Properties
    
    private var text: String

    // MARK: - UI Components
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .main
        label.font = .fontGuide(.SB00_18)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - View Life Cycle
    
    init(frame: CGRect, text: String) {
        self.text = text
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

private extension AuthHeaderView {
    
    // MARK: - Methods
    
    func setUI() {
        title.text = text
    }
    
    func setHierarchy() {
        self.addSubview(title)
    }

    func setLayout() {
        title.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
