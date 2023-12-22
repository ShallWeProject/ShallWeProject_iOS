//
//  CustomBoxView.swift
//  ShallWe
//
//  Created by 김나연 on 12/22/23.
//

import UIKit

final class CustomBoxView: UIView {
    
    // MARK: - Properties
    
    private var titleText: String

    // MARK: - UI Components
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        return label
    }()
    
    // MARK: - View Life Cycle
    
    init(frame: CGRect, title: String) {
        self.titleText = title
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

extension CustomBoxView {
    
    // MARK: - Methods
    
    private func setUI() {
        title.text = titleText
        backgroundColor = .gray0
        makeBorder(width: 1, color: .gray2)
        layer.cornerRadius = 10
    }
    
    private func setHierarchy() {
        self.addSubviews(title)
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(47)
        }
        
        title.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func changeToPink() {
        backgroundColor = .bg2
        makeBorder(width: 1, color: .line1)
        title.textColor = .main
        title.font = .fontGuide(.SB00_14)
    }
    
    func changeToGray() {
        backgroundColor = .gray0
        makeBorder(width: 1, color: .gray2)
        title.textColor = .black0
        title.font = .fontGuide(.M00_14)
    }
}
