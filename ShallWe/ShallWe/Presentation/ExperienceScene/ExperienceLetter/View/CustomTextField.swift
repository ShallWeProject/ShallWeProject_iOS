//
//  CustomTextField.swift
//  ShallWe
//
//  Created by 고아라 on 2/19/24.
//

import UIKit

final class CustomTextField: UITextField {
    
    // MARK: - Properties
    
    @frozen
    enum TextFieldStatus {
        case normal
        case correct
        
        var borderColor: CGColor? {
            switch self {
            case .normal:
                return UIColor.gray2.cgColor
            case .correct:
                return UIColor.bg4.cgColor
            }
        }
        
        var backgroundColor: UIColor? {
            switch self {
            case .normal:
                return UIColor.gray0
            case .correct:
                return UIColor.bg1
            }
        }
    }
    
    enum TextFieldType {
        case name
        case phone
    }
    
    var textFieldStatus: TextFieldStatus = .normal {
        didSet {
            updateBorderColor()
        }
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type: TextFieldType, placeHolder: String) {
        self.init()
        
        setUI(type: type, placeHolder: placeHolder)
    }
}

// MARK: - Extensions

private extension CustomTextField {
    func setUI(type: TextFieldType, placeHolder: String) {
        self.placeholder = "\(placeHolder)"
        self.setPlaceholderColor(.gray4)
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.gray2.cgColor
        self.layer.borderWidth = 1
        self.font = .fontGuide(.M00_12)
        self.backgroundColor = .gray0
        
        switch type {
        case .name:
            self.setLeftPadding(amount: 14)
            self.textAlignment = .left
        case .phone:
            self.textAlignment = .center
        }
    }
    
    func updateBorderColor() {
        self.layer.borderColor = textFieldStatus.borderColor
        self.backgroundColor = textFieldStatus.backgroundColor
    }
}
