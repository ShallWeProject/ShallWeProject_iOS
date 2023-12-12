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

final class HomeRecommendViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let experiencePageView = HomeRecommendView()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceViewModel()
    private let disposebag = DisposeBag()
    
    override func bindViewModel() {
        
        viewModel.outputs.recommendMenu
            .bind(to: experiencePageView.menuCollectionView.rx
                .items(cellIdentifier: HomeMenuCollectionViewCell.className,
                       cellType: HomeMenuCollectionViewCell.self)) { (index, model, cell) in
                cell.configureCell(model)
                }
                .disposed(by: disposebag)
        
        experiencePageView.menuCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                viewModel.inputs.menuCellTap(at: indexPath)
            })
            .disposed(by: disposebag)
        
        viewModel.outputs.isSelectedMenuCell
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let cell = experiencePageView.menuCollectionView.cellForItem(at: indexPath) as? HomeMenuCollectionViewCell {
                    cell.isSelected = true
                    cell.setUnderLineWidth(size: experiencePageView.labelWidthSize(index: indexPath.row))
                }
                experiencePageView.didTapCell(at: indexPath)
            })
            .disposed(by: disposebag)
        
        viewModel.outputs.setMenuCell
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                experiencePageView.menuCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
                
            })
            .disposed(by: disposebag)
        
        viewModel.outputs.setRecommendListVC
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] vc in
                guard let self = self else { return }
                if let firstVC = vc.first {
                    experiencePageView.pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
                }
            })
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
        experiencePageView.menuCollectionView.registerCell(HomeMenuCollectionViewCell.self)
    }
}
