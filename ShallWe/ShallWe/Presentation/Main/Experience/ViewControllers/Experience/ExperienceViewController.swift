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
    
    private let experienceView = HomeExperienceListView()
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var isDropDownActivated: Bool = false
    
    override func bindViewModel() {
        
        experienceView.headerView.sortButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard self != nil else { return }
                print("버튼 탭")
            })
            .disposed(by: disposeBag)
        
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
