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
    
    override func bindViewModel() {
        viewModel.outputs.birthList
            .bind(to: experienceView.homelistCollectionView.rx
                .items(cellIdentifier: HomeExperienceCell.className, 
                       cellType: HomeExperienceCell.self)) { (index, model, cell) in
                    cell.configureCell(model)
                }
                .disposed(by: disposeBag)
        
        experienceView.dropDownButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.experienceView.homeDropDown.show()
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