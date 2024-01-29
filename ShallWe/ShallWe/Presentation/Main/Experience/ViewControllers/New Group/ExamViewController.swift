//
//  ExamViewController.swift
//  ShallWe
//
//  Created by KJ on 1/28/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class ExamViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let examView = ExamView()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceViewModel()
    private let disposeBag = DisposeBag()
    var index: Int = 0
    private var sortType: IndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: - Initializer
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        examView.menuCollectionVieww.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    override func bindViewModel() {
        
        navigationBar.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.recommendMenu
            .bind(to: examView.menuCollectionVieww.rx
                .items(cellIdentifier: HomeMenuCollectionViewCell.className,
                       cellType: HomeMenuCollectionViewCell.self)) { (index, model, cell) in
                cell.configureCell(model)
            }
                       .disposed(by: disposeBag)
        
        examView.menuCollectionVieww.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                viewModel.inputs.menuCellTap(at: indexPath)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.isSelectedMenuCell
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let cell = examView.menuCollectionVieww.cellForItem(at: indexPath) as? HomeMenuCollectionViewCell {
                    cell.isSelected = true
                    cell.setUnderLineWidth(size: examView.labelWidthSize(index: indexPath.row))
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.setMenuCell
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                print("??")
                
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.presentSortModal
            .subscribe(onNext: { [weak self] in
                self?.presentToHalfModal()
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.sortTypeChange
            .subscribe(onNext: { [weak self] indexPath in
                self?.sortType = indexPath
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(examView)
        
        examView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setRegister() {
        examView.menuCollectionVieww.registerCell(HomeMenuCollectionViewCell.self)
//        examView.sortButtonDelegate = self
    }
    
    func presentToHalfModal() {
        let sortVC = SortHalfModal(viewModel: viewModel, index: sortType)
        sortVC.modalPresentationStyle = .pageSheet
//        let customDetentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
//        let customDetent = UISheetPresentationController.Detent.custom(identifier: customDetentIdentifier) { (_) in
//            return SizeLiterals.Screen.screenHeight * 258 / 812
//        }
//        
//        if let sheet = sortVC.sheetPresentationController {
//            sheet.detents = [customDetent]
//            sheet.preferredCornerRadius = 10
//            sheet.prefersGrabberVisible = true
//            sheet.delegate = self
//            sheet.delegate = sortVC as? any UISheetPresentationControllerDelegate
//        }
        
        present(sortVC, animated: true)
    }
}

//extension ExamViewController: SortButtonTapProtocol {
    
//    func presentToSortModal() {
//        viewModel.inputs.sortButtonTap()
//    }
//}
