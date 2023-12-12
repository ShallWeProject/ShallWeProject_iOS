//
//  HomeExperienceListView.swift
//  ShallWe
//
//  Created by KJ on 12/13/23.
//

import UIKit

import Then
import SnapKit

final class HomeExperienceListView: BaseView {
    
    // MARK: - UI Components
    
    lazy var homelistCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
        homelistCollectionView.do {
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
        
        self.addSubviews(homelistCollectionView)
        
        homelistCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        homelistCollectionView.delegate = self
        homelistCollectionView.registerCell(HomeExperienceCell.self)
    }
}

extension HomeExperienceListView: UICollectionViewDelegateFlowLayout {
    
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
