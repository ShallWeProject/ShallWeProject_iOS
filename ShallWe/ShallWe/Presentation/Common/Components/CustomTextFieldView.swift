//
//  AuthTextFieldView.swift
//  ShallWe
//
//  Created by 김나연 on 12/7/23.
//

import UIKit

import SnapKit

final class CustomTextFieldView: UITextField {
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        
        self.placeholder = placeholder
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension CustomTextFieldView {
    
    // MARK: - Methods
    
    private func setUI() {
        setLeftPadding(amount: 18)
        setRightPadding(amount: 18)
        setPlaceholderColor(.gray4)
        textColor = .black
        font = .fontGuide(.M00_14)
        backgroundColor = .gray0
        makeBorder(width: 1, color: .gray2)
        layer.cornerRadius = 10
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(40)
        }
    }
}
