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
    
    private enum HomeSectionType: CaseIterable {
        case gallery, recommend, popularCategory, experience
    }
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let searchView = SearchView()
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    private let galleryIndexLabel = UILabel()
    
    // MARK: - Properties
    
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    private let recommendModel: [RecommendModel] = RecommendModel.recommendCategoryData()
    private let popularCategoryModel: [PopularCategoryModel] = PopularCategoryModel.popularCategoryTitleData()
    var selectedIndexPath: IndexPath = IndexPath(row: 0, section: 2)
    
    override func bindViewModel() {
        viewModel.outputs.selectedCellIndex
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let indexPath = indexPath {
                    if let cell = homeCollectionView.cellForItem(at: indexPath) as? HomePopularCategoryCell {
                        cell.isSelected = true
                        self.selectedIndexPath = indexPath
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        self.view.backgroundColor = .white
        
        navigationBar.do {
            $0.isLogoViewIncluded = true
        }
        
        homeCollectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = true
            $0.backgroundColor = .clear
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.setSectionLayout()
        }
        
        galleryIndexLabel.do {
            $0.text = "1 | 2"
            $0.font = .fontGuide(.SB00_12)
            $0.textColor = .white
            $0.textAlignment = .center
            $0.backgroundColor = .black_50
            $0.makeCornerRound(radius: 10)
            $0.partColorChange(targetString: "| 2", textColor: .white.withAlphaComponent(0.7))
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        self.view.addSubviews(navigationBar, searchView, homeCollectionView, galleryIndexLabel)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        searchView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(37)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        galleryIndexLabel.snp.makeConstraints {
            $0.top.equalTo(homeCollectionView.snp.top).offset(SizeLiterals.Screen.screenHeight * 220 / 812)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(46)
            $0.height.equalTo(20)
        }
    }
    
    override func setDelegate() {
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
    }
    
    override func setRegister() {
        homeCollectionView.registerCell(HomeGalleryCell.self)
        homeCollectionView.registerCell(HomeRecommendCell.self)
        homeCollectionView.registerCell(HomePopularCategoryCell.self)
        homeCollectionView.registerCell(ExperienceCell.self)
        homeCollectionView.registerHeader(HomeHeaderView.self)
    }
}

extension HomeViewController {
    
    // MARK: - Methods
    
    private func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            let sectionType = HomeSectionType.allCases[section]
            switch sectionType {
            case .gallery:
                return self.getLayoutGallerySection()
            case .recommend:
                return self.getLayoutRecommendSection()
            case .popularCategory:
                return self.getLayoutPopularCategorySection()
            case .experience:
                return self.getLayoutExperienceSection()
            }
        }
    }
    
    func getLayoutGallerySection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(SizeLiterals.Screen.screenHeight * 242 / 812)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 13, leading: 0, bottom: 18, trailing: 0)
        section.orthogonalScrollingBehavior = .paging
        
        // 현재 셀의 인덱스
        section.visibleItemsInvalidationHandler = { [weak self] (visibleItems, offset, env) in
            let currentPage = Int(max(0, round(offset.x / env.container.contentSize.width)))
            self?.viewModel.inputs.updateCurrentIndex(to: currentPage)
            print(currentPage)
        }
        return section
    }
    
    private func getLayoutRecommendSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(SizeLiterals.Screen.screenWidth * 100 / 375),
            heightDimension: .absolute(SizeLiterals.Screen.screenHeight * 100 / 812)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(20)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -9, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 9, bottom: 22, trailing: 16)
        
        return section
    }
    
    private func getLayoutPopularCategorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(47),
            heightDimension: .absolute(27)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(1.0),
            heightDimension: .absolute(27)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(7)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(20)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 4
        section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 16, bottom: 14, trailing: 9)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 7
        
        return section
    }
    
    private func getLayoutExperienceSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .estimated(240)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.38)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(18)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 86, trailing: 16)
        return section
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = HomeSectionType.allCases[section]
        switch sectionType {
        case .gallery:
            return 2
        case .recommend:
            return recommendModel.count
        case .popularCategory:
            return popularCategoryModel.count
        case .experience:
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = HomeSectionType.allCases[indexPath.section]
        switch sectionType {
        case .gallery:
            let cell = collectionView.dequeueCell(type: HomeGalleryCell.self, indexPath: indexPath)
            return cell
        case .recommend:
            let cell = collectionView.dequeueCell(type: HomeRecommendCell.self, indexPath: indexPath)
            cell.configureCell(recommendModel[indexPath.row])
            return cell
        case .popularCategory:
            let cell = collectionView.dequeueCell(type: HomePopularCategoryCell.self, indexPath: indexPath)
            cell.configureCell(popularCategoryModel[indexPath.row])
            collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .init())
            return cell
        case .experience:
            let cell = collectionView.dequeueCell(type: ExperienceCell.self, indexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = HomeSectionType.allCases[indexPath.section]
        switch sectionType {
        case .gallery:
            let view = UICollectionReusableView()
            return view
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
        case .gallery:
            return
        case .recommend:
            print("recommend")
        case .popularCategory:
            viewModel.inputs.popularCategoryCellTap(at: indexPath)
        case .experience:
            print("experience")
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? HomePopularCategoryCell {
            collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .init())
        }
    }
}
