//
//  CategoryListViewController.swift
//  ShallWe
//
//  Created by KJ on 2/8/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

final class CategoryListViewController: BaseViewController {
    
    // MARK: - UI Components
    
    let categoryView = HomeExperienceView()
    private let homeExperienceListView = HomeExperienceListView()
    
    // MARK: - Properties
    
    private let viewModel = HomeExperienceViewModel()
    private let disposeBag = DisposeBag()
    var categoryIndex: IndexPath
    private var sortType: IndexPath = IndexPath(row: 0, section: 0)
    private var isDropDownActivated: Bool = false
    var presentSortModal: (() -> Void)?
    
    // MARK: - Initializer
    
    init(index: IndexPath) {
        self.categoryIndex = index
        self.viewModel.inputs.menuCellTap(at: categoryIndex)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        categoryView.menuCollectionView.selectItem(at: IndexPath(item: categoryIndex.row, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    override func bindViewModel() {
        
        viewModel.outputs.expCategory
            .bind(to: homeExperienceListView.homelistCollectionView.rx
                .items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        categoryView.navigationBar.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.categoryMenu
            .bind(to: categoryView.menuCollectionView.rx
                .items(cellIdentifier: HomeMenuCollectionViewCell.className,
                       cellType: HomeMenuCollectionViewCell.self)) { (index, model, cell) in
                cell.configureCell(model)
            }
                       .disposed(by: disposeBag)
        
        categoryView.menuCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                viewModel.inputs.menuCellTap(at: indexPath)
                homeExperienceListView.indexPath = IndexPath(item: 0, section: 0)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.isSelectedMenuCell
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let cell = categoryView.menuCollectionView.cellForItem(at: indexPath) as? HomeMenuCollectionViewCell {
                    cell.isSelected = true
                    cell.setUnderLineWidth(size: categoryView.labelWidthSize(index: indexPath.row))
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.setMenuCell
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .white
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(categoryView, homeExperienceListView)
        
        categoryView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        homeExperienceListView.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setRegister() {
        categoryView.menuCollectionView.registerCell(HomeMenuCollectionViewCell.self)
        self.homeExperienceListView.homelistCollectionView.registerCell(HomeExperienceCell.self)
    }
    
    func presentToHalfModal(index: IndexPath) {
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
        self.present(sortVC, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<SectionOfHomeExperience>(
        configureCell: { (dataSource, collectionView, indexPath, item) in
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeExperienceCell.className,
                for: indexPath) as? HomeExperienceCell else { return UICollectionViewCell() }
            cell.configureCell(item)
            return cell
        }, configureSupplementaryView: { [weak self] dataSource, collectionView, kind, indexPath in
            
            guard let self = self,
                  let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExperienceHeader.className, for: indexPath) as? ExperienceHeader else { return UICollectionReusableView() }
            
            header.setButtonTitle(IndexPath(row: 0, section: 0))
            
            if let indexPath = self.homeExperienceListView.indexPath {
                header.setButtonTitle(indexPath)
            }
            
            // 카테고리 정렬 버튼
            header.sortButton.rx.tap
                .bind {
                    self.presentToHalfModal(index: indexPath)
                }
                .disposed(by: disposeBag)
            
            viewModel.outputs.changeSortType
                .subscribe(onNext: { [weak self] title in
                    header.sortButton.setTitle(title, for: .normal)
                })
                .disposed(by: disposeBag)
            
            return header
        }
    )
}

extension CategoryListViewController: UISheetPresentationControllerDelegate {}
