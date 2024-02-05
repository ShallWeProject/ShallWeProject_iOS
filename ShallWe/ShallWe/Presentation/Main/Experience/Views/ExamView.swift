//
//  ExamView.swift
//  ShallWe
//
//  Created by KJ on 1/28/24.
//

import UIKit

import Then
import SnapKit

final class HomeExperienceView: BaseView {
    
    // MARK: - UI Components
    
    let navigationBar = CustomNavigationBar()
    lazy var menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: menuCollectionFlowLayout)
    private let menuCollectionFlowLayout = UICollectionViewFlowLayout()
    private let underLine = UIView()
    
    // MARK: - UI Components Property
    
    private let menuTitleModel: [HomeExperienceType] = HomeExperienceType.recommendMenu()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
        navigationBar.do {
            $0.isBackButtonIncluded = true
            $0.isLogoViewIncluded = true
        }
        
        menuCollectionView.do {
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        menuCollectionFlowLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
            $0.minimumInteritemSpacing = 0
        }
        
        underLine.do {
            $0.backgroundColor = .gray0
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {

        self.addSubviews(navigationBar, menuCollectionView, underLine)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 42 / 812)
        }
        
        underLine.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        menuCollectionView.delegate = self
    }
}

extension HomeExperienceView {
    
    func labelWidthSize(index: Int) -> Int {
        let size = menuTitleModel[index].type.size(
            withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .regular)]).width
        return Int(size)
    }
    
    private func cellUnderLineSetting(cell: HomeMenuCollectionViewCell?, indexPath: IndexPath, selected: Bool) {
        cell?.isSelected = selected
        cell?.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
    }
}

extension HomeExperienceView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = SizeLiterals.Screen.screenWidth * CGFloat(labelWidthSize(index: indexPath.row) + 23) / 375
        let height = SizeLiterals.Screen.screenHeight <= 800 ? CGFloat(34) : CGFloat(42)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = SizeLiterals.Screen.screenWidth * 25 / 375
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let myCell = cell as? HomeMenuCollectionViewCell {
            myCell.underLine.isHidden = !myCell.isSelected
            myCell.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
        }
    }
}
