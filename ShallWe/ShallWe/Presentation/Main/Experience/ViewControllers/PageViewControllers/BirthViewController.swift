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
    private lazy var activateDropDownAlert = ActivateDropDownAlert()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceListViewModel()
    private let disposeBag = DisposeBag()
    
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
