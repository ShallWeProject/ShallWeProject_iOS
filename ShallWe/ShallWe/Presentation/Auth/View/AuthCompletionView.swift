//
//  AuthCompletionView.swift
//  ShallWe
//
//  Created by 김나연 on 12/16/23.
//

import UIKit

import SnapKit

final class AuthCompletionView: BaseView {
    
    // MARK: - Properties
    
    private var mainText: String
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    
    // MARK: - View Life Cycle
    
    init(frame: CGRect, mainText: String) {
        self.mainText = mainText
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Helper
    
    override func setStyle() {
        self.backgroundColor = .white
        
        navigationBar.do {
            $0.isLogoViewIncluded = true
        }
    }
    
    override func setLayout() {
        self.addSubviews(navigationBar)
        
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}

// MARK: - Extensions

//extension AuthCompletionView {
//    func setLayout() {
//        
//    }
//}
