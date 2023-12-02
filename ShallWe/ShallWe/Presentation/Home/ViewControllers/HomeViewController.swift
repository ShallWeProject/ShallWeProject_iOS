//
//  HomeViewController.swift
//  ShallWe
//
//  Created by KJ on 11/28/23.
//

import UIKit

import Then
import SnapKit

final class HomeViewController: BaseViewController {
    
    private enum SectionType: CaseIterable {
        case gallery, recommend, popularCategory, experience
    }
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let searchView = SearchView()
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    
    // MARK: - Properties
    
    private let recommendModel: [RecommendModel] = RecommendModel.recommendCategoryData()
    private let popularCategoryModel: [PopularCategoryModel] = PopularCategoryModel.popularCategoryTitleData()
    
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
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        self.view.addSubviews(navigationBar, searchView, homeCollectionView)
        
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
            let sectionType = SectionType.allCases[section]
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
    
    private func getLayoutGallerySection() -> NSCollectionLayoutSection {
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
            widthDimension: .absolute(500),
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
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .gallery:
            return 2
        case .recommend:
            return 5
        case .popularCategory:
            return 10
        case .experience:
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
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
            return cell
        case .experience:
            let cell = collectionView.dequeueCell(type: ExperienceCell.self, indexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .gallery:
            let view = UICollectionReusableView()
            return view
        case .recommend:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: HomeHeaderView.self, indexPath: indexPath)
            headerView.isRecommendHeaderIncluded = true
            return headerView
        case .popularCategory:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: HomeHeaderView.self, indexPath: indexPath)
            headerView.isPopularHeaderIncluded = true
            return headerView
        case .experience:
            let view = UICollectionReusableView()
            return view
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
}
