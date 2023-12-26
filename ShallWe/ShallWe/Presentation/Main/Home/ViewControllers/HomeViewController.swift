//
//  HomeViewController.swift
//  ShallWe
//
//  Created by KJ on 11/28/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class HomeViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    // MARK: - Properties
    
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    private let recommendModel: [RecommendModel] = RecommendModel.recommendCategoryData()
    private let popularCategoryModel: [PopularCategoryModel] = PopularCategoryModel.popularCategoryTitleData()
    private var galleryModel: [GalleryModel] = GalleryModel.galleryDummydata()
    private var experienceModel: [HomeExperienceModel] = HomeExperienceModel.homeExperienceDummyData()
    private let recommendVC = HomeRecommendViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func bindViewModel() {
        viewModel.outputs.selectedPopularCellIndex
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let indexPath = indexPath {
                    if let cell = homeView.homeCollectionView.cellForItem(at: indexPath) as? HomePopularCategoryCell {
                        cell.isSelected = true
                        self.homeView.selectedIndexPath = indexPath
                    }
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.selectedRecommendCellIndex
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                print(indexPath)
                self.navigationController?.pushViewController(HomeRecommendViewController(), animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Layout Helper 
    
    override func setLayout() {
        
        self.view.addSubviews(homeView)
        
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        homeView.homeCollectionView.dataSource = self
        homeView.homeCollectionView.delegate = self
    }
    
    override func setRegister() {
        homeView.homeCollectionView.registerCell(HomeGalleryCell.self)
        homeView.homeCollectionView.registerCell(HomeRecommendCell.self)
        homeView.homeCollectionView.registerCell(HomePopularCategoryCell.self)
        homeView.homeCollectionView.registerCell(HomeExperienceCell.self)
        homeView.homeCollectionView.registerHeader(HomeHeaderView.self)
        homeView.homeCollectionView.registerFooter(GalleryFooterView.self)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = HomeSectionType.allCases[section]
        switch sectionType {
        case .gallery:
            return galleryModel.count
        case .recommend:
            return recommendModel.count
        case .popularCategory:
            return popularCategoryModel.count
        case .experience:
            return experienceModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = HomeSectionType.allCases[indexPath.section]
        switch sectionType {
        case .gallery:
            let cell = collectionView.dequeueCell(type: HomeGalleryCell.self, indexPath: indexPath)
            cell.configureCell(galleryModel[indexPath.row])
            return cell
        case .recommend:
            let cell = collectionView.dequeueCell(type: HomeRecommendCell.self, indexPath: indexPath)
            cell.configureCell(recommendModel[indexPath.row])
            return cell
        case .popularCategory:
            let cell = collectionView.dequeueCell(type: HomePopularCategoryCell.self, indexPath: indexPath)
            cell.configureCell(popularCategoryModel[indexPath.row])
            collectionView.selectItem(at: homeView.selectedIndexPath, animated: false, scrollPosition: .init())
            return cell
        case .experience:
            let cell = collectionView.dequeueCell(type: HomeExperienceCell.self, indexPath: indexPath)
            cell.configureCell(experienceModel[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = HomeSectionType.allCases[indexPath.section]
        switch sectionType {
        case .gallery:
            let footerView = collectionView.dequeueReusableCell(kind: kind, type: GalleryFooterView.self, indexPath: indexPath)
            footerView.bind(input: homeView.currentIndex)
            return footerView
        case .recommend:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: HomeHeaderView.self, indexPath: indexPath)
            headerView.homeHeaderType(.recommend)
            return headerView
        case .popularCategory:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: HomeHeaderView.self, indexPath: indexPath)
            headerView.homeHeaderType(.popular)
            return headerView
        case .experience:
            let view = UICollectionReusableView()
            return view
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = HomeSectionType.allCases[indexPath.section]
        switch sectionType {
        case .popularCategory:
            viewModel.inputs.popularCategoryCellTap(at: indexPath)
        case .recommend:
            viewModel.inputs.recommendCellTap(at: indexPath)
        case .gallery, .experience:
            return
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell is HomePopularCategoryCell {
            collectionView.selectItem(at: homeView.selectedIndexPath, animated: false, scrollPosition: .init())
        }
    }
}
