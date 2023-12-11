//
//  ExperienceViewController.swift
//  ShallWe
//
//  Created by KJ on 12/11/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class ExperienceViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let experienceView = ExperienceView()
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        self.view.addSubviews(experienceView)
        
        experienceView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
