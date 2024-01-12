//
//  CustomBoxView.swift
//  ShallWe
//
//  Created by 김나연 on 12/22/23.
//

import UIKit

final class CustomButton: UIButton {
    
    // MARK: - Properties
    
    private var titleText: String
    
    // MARK: - View Life Cycle
    
    init(frame: CGRect, title: String) {
        self.titleText = title
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension CustomButton {
    
    // MARK: - Methods
    
    private func setUI() {
        setTitle(titleText, for: .normal)
        setTitleColor(.black0, for: .normal)
        titleLabel?.font = .fontGuide(.M00_14)
        backgroundColor = .gray0
        makeBorder(width: 1, color: .gray2)
        layer.cornerRadius = 10
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(47)
        }
    }
    
    func changeToPink() {
        backgroundColor = .bg2
        makeBorder(width: 1, color: .line1)
        setTitleColor(.main, for: .normal)
        titleLabel?.font = .fontGuide(.SB00_14)
    }
    
    func changeToGray() {
        backgroundColor = .gray0
        makeBorder(width: 1, color: .gray2)
        setTitleColor(.black0, for: .normal)
        titleLabel?.font = .fontGuide(.M00_14)
    }
}

final class CustomCheckbutton: UIButton {
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setUI() {
        setImage(ImageLiterals.Icon.check_default, for: .normal)
    }
    
    func changeIcnoToPink() {
        setImage(ImageLiterals.Icon.check_activated, for: .normal)
    }
    
    func changeIcnoToGray() {
        setImage(ImageLiterals.Icon.check_default, for: .normal)
    }
}
