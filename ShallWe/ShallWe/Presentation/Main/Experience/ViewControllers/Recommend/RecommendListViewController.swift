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

final class RecommendListViewController: BaseViewController {
    
    // MARK: - UI Components
    
    let recommendView = HomeExperienceView()
    private let homeExperienceListView = HomeExperienceListView()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceViewModel()
    private let disposeBag = DisposeBag()
    var recommendIndex: IndexPath
    private var sortType: IndexPath = IndexPath(row: 0, section: 0)
    private var isDropDownActivated: Bool = false
    var presentSortModal: (() -> Void)?
    
    // MARK: - Initializer
    
    init(index: IndexPath) {
        self.recommendIndex = index
        self.viewModel.inputs.menuCellTap(at: recommendIndex)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        recommendView.menuCollectionView.selectItem(at: IndexPath(item: recommendIndex.item, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    override func bindViewModel() {
    
        recommendView.navigationBar.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.recommendMenu
            .bind(to: recommendView.menuCollectionView.rx
                .items(cellIdentifier: HomeMenuCollectionViewCell.className,
                       cellType: HomeMenuCollectionViewCell.self)) { (index, model, cell) in
                cell.configureCell(model)
            }
                       .disposed(by: disposeBag)
        
        recommendView.menuCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                viewModel.inputs.menuCellTap(at: indexPath)
                homeExperienceListView.indexPath = IndexPath(item: 0, section: 0) // 정렬 버튼 초기화
                // 셀 탭했을 시
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.isSelectedMenuCell
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let cell = recommendView.menuCollectionView.cellForItem(at: indexPath) as? HomeMenuCollectionViewCell {
                    cell.isSelected = true
                    cell.setUnderLineWidth(size: recommendView.labelWidthSize(index: indexPath.row))
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
        
//        viewModel.outputs.presentSortModal
//            .subscribe(onNext: { [weak self] in
//                self?.presentToHalfModal()
//            })
//            .disposed(by: disposeBag)
        
//        viewModel.outputs.sortTypeChange
//            .subscribe(onNext: { [weak self] indexPath in
//                self?.sortType = indexPath
//                self?.homeExperienceListView.indexPath = indexPath
//            })
//            .disposed(by: disposeBag)
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(recommendView, homeExperienceListView)
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        homeExperienceListView.snp.makeConstraints {
            $0.top.equalTo(recommendView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setRegister() {
        recommendView.menuCollectionView.registerCell(HomeMenuCollectionViewCell.self)
    }
    
//    func presentToHalfModal() {
//        let sortVC = SortHalfModal(viewModel: viewModel, index: sortType)
//        sortVC.modalPresentationStyle = .pageSheet
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
        
//        present(sortVC, animated: true, completion: nil)
//        if presentationController != nil {
//            presentedViewController?.dismiss(animated: false) {
//                // 현재 모달이 해제된 후에 새로운 모달을 표시
//                self.present(sortVC, animated: true, completion: nil)
//            }
//        } else {
//            self.present(sortVC, animated: true)
//        }
//
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendListViewController: UISheetPresentationControllerDelegate {}
