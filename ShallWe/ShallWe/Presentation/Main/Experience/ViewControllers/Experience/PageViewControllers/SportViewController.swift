//
//  SportViewController.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class SportViewController: BaseViewController {

    // MARK: - UI Components
    
    let experienceView = HomeExperienceListView()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceListViewModel()
    private let disposeBag = DisposeBag()
    private var isDropDownActivated: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func bindViewModel() {
        
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
