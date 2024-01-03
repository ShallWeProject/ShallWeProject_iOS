//
//  SearchResultView.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit

final class SearchResultView: BaseView {

    // MARK: - UI Components
    
    lazy var searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    // MARK: - Properties
    
    private let dummyModel = HomeExperienceModel.homeExperienceDummyData()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
        searchCollectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.scrollDirection = .vertical
            $0.minimumLineSpacing = SizeLiterals.Screen.screenWidth * 16 / 375
            $0.minimumInteritemSpacing = SizeLiterals.Screen.screenHeight * 18 / 812
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.addSubviews(searchCollectionView)
        
        searchCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.registerCell(HomeExperienceCell.self)
    }
}

extension SearchResultView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = SizeLiterals.Screen.screenWidth * 162 / 375
        let height = CGFloat(240)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = SizeLiterals.Screen.screenWidth * 16 / 375
        return UIEdgeInsets(top: 14, left: inset, bottom: 86, right: inset)
    }
}

extension SearchResultView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: HomeExperienceCell.self, indexPath: indexPath)
        cell.configureCell(dummyModel[indexPath.row])
        return cell
    }
}
