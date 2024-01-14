//
//  BirthViewController.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class BirthViewController: BaseViewController {

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
