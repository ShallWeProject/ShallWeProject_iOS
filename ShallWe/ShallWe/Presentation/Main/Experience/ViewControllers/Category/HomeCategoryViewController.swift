//
//  HomeCategoryViewController.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class HomeCategoryViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let experiencePageView = HomeCategoryView()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceViewModel()
    private let disposebag = DisposeBag()
    var index: Int = 0
    private var sortType: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        let vc = ExperiencePageVC.categoryPageVC(viewModel)
        print(index)
            experiencePageView.pageViewController.setViewControllers([vc[index]], direction: .forward, animated: true, completion: nil)
        experiencePageView.menuCollectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    override func bindViewModel() {
        
        navigationBar.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposebag)
        
        viewModel.outputs.categoryMenu
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
        
        viewModel.outputs.presentSortModal
            .subscribe(onNext: { [weak self] in
                self?.presentToHalfModal()
            })
            .disposed(by: disposebag)
        
        viewModel.outputs.sortTypeChange
            .subscribe(onNext: { [weak self] indexPath in
                self?.sortType = indexPath
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
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setRegister() {
        experiencePageView.menuCollectionView.registerCell(HomeMenuCollectionViewCell.self)
    }
}

extension HomeCategoryViewController {
    
    // MARK: - Methods
    
    func presentToHalfModal() {
        let sortVC = SortHalfModal(viewModel: viewModel, index: sortType)
        sortVC.modalPresentationStyle = .pageSheet
        let customDetentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
        let customDetent = UISheetPresentationController.Detent.custom(identifier: customDetentIdentifier) { (_) in
            return SizeLiterals.Screen.screenHeight * 258 / 812
        }
        
        if let sheet = sortVC.sheetPresentationController {
            sheet.detents = [customDetent]
            sheet.preferredCornerRadius = 10
            sheet.prefersGrabberVisible = true
            sheet.delegate = self
            sheet.delegate = sortVC as? any UISheetPresentationControllerDelegate
        }
        
        present(sortVC, animated: true)
    }
}

extension HomeCategoryViewController: UISheetPresentationControllerDelegate {}

