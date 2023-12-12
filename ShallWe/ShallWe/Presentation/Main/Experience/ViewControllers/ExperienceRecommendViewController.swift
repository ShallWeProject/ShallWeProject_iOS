//
//  ExperienceRecommendViewController.swift
//  ShallWe
//
//  Created by KJ on 12/11/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class ExperienceRecommendViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let experiencePageView = ExperienceRecommendPageView()
    
    // MARK: - Properties
    
    private let viewModel = ExperienceViewModel()
    private let disposebag = DisposeBag()
    
    override func bindViewModel() {
        
        viewModel.outputs.recommendMenu
            .bind(to: experiencePageView.menuCollectionView.rx
                .items(cellIdentifier: ExperienceMenuCollectionViewCell.className,
                       cellType: ExperienceMenuCollectionViewCell.self)) { (index, model, cell) in
                cell.configureCell(model)
                }
                .disposed(by: disposebag)
        
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .white
        
        navigationBar.do {
            $0.isBackButtonIncluded = true
            $0.isLogoViewIncluded = true
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(navigationBar, experiencePageView)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
        
        experiencePageView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(self.tabBarHeight)
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {

    }
    
    override func setRegister() {
        experiencePageView.menuCollectionView.registerCell(ExperienceMenuCollectionViewCell.self)
    }
}
