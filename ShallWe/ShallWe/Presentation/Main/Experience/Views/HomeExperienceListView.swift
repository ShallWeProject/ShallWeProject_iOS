//
//  HomeExperienceListView.swift
//  ShallWe
//
//  Created by KJ on 12/13/23.
//

import UIKit

import Then
import SnapKit
import DropDown

final class HomeExperienceListView: BaseView {
    
    // MARK: - UI Components
    
    let dropDownButton = UIButton()
    lazy var dropView = UIView()
    let homeDropDown = DropDown()
    lazy var homelistCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
        dropDownButton.do {
            $0.setTitle("인기순", for: .normal)
            $0.setTitleColor(.black0, for: .normal)
            $0.backgroundColor = .bg2
            $0.makeBorder(width: 0.8, color: .bg4)
            $0.titleLabel?.font = .fontGuide(.M00_12)
            $0.makeCornerRound(radius: 12)
        }
        
        dropView.do {
            $0.backgroundColor = .clear
        }
        
        homeDropDown.do {
            $0.anchorView = self.dropView
            $0.backgroundColor = .bg1
            $0.textColor = .black0
            $0.dismissMode = .onTap
            $0.setupCornerRadius(12)
            $0.dataSource = ["추천순", "가격높은순", "가격낮은순"]
            $0.textFont = .fontGuide(.R00_10)
            $0.selectionBackgroundColor = .bg1
            $0.cellHeight = 25
            $0.cornerRadius = 12
        }
        
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
        
        self.addSubviews(dropDownButton, dropView, homelistCollectionView)
        
        dropDownButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(82)
            $0.height.equalTo(25)
        }
        
        dropView.snp.makeConstraints {
            $0.top.equalTo(dropDownButton.snp.bottom)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(82)
            $0.height.equalTo(1)
        }
        
        homelistCollectionView.snp.makeConstraints {
            $0.top.equalTo(dropView.snp.bottom).offset(13)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        homelistCollectionView.delegate = self
        homelistCollectionView.registerCell(HomeExperienceCell.self)
    }
    
    func setDropDown() {
        
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
