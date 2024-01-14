//
//  ExperienceViewController.swift
//  ShallWe
//
//  Created by KJ on 1/14/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

class ExperienceViewController: BaseViewController {

    // MARK: - UI Components
    
    let experienceView = HomeExperienceListView()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceListViewModel()
    private let disposeBag = DisposeBag()
    private var isDropDownActivated: Bool = false
    
    override func bindViewModel() {
        
//        experienceView.buttonTap()
    }
    
    override func setStyle() {
        
        self.view.backgroundColor = .clear
    }
    
    override func setLayout() {
        
        self.view.addSubviews(experienceView)
        
        experienceView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
