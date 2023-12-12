//
//  ExperienceRecommendPageView.swift
//  ShallWe
//
//  Created by KJ on 12/11/23.
//

import UIKit

import Then
import SnapKit

final class ExperienceRecommendPageView: BaseView {

    // MARK: - UI Components
    
    lazy var menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: menuCollectionFlowLayout)
    lazy var pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                               navigationOrientation: .horizontal)
    private let menuCollectionFlowLayout = UICollectionViewFlowLayout()
    
    // MARK: - UI Components Property
    
    private let menuTitleModel: [ExperienceType] = ExperienceType.recommendMenu()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
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
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.addSubviews(menuCollectionView, pageViewController.view)
        
        menuCollectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 42 / 812)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

extension ExperienceRecommendPageView {
    
    func labelWidthSize(index: Int) -> Int {
        let size = menuTitleModel[index].type.size(
            withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .regular)]).width
        return Int(size)
    }
    
    private func cellUnderLineSetting(cell: ExperienceMenuCollectionViewCell?, indexPath: IndexPath, selected: Bool) {
        cell?.isSelected = selected
        cell?.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
    }
}
