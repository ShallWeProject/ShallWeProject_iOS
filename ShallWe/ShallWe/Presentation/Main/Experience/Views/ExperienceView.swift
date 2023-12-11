//
//  ExperienceView.swift
//  ShallWe
//
//  Created by KJ on 12/11/23.
//

import UIKit

final class ExperienceView: BaseView {

    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .white
        
        navigationBar.do {
            $0.isBackButtonIncluded = true
            $0.isLogoViewIncluded = true
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.addSubviews(navigationBar)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
    }
}
