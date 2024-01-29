//
//  ExamView.swift
//  ShallWe
//
//  Created by KJ on 1/28/24.
//

import UIKit

import Then
import SnapKit

final class ExamView: BaseView {
    
    // MARK: - UI Components
    
    lazy var menuCollectionVieww = UICollectionView(frame: .zero, collectionViewLayout: menuCollectionFlowLayout)
    private let menuCollectionFlowLayout = UICollectionViewFlowLayout()
    
    // MARK: - UI Components Property
    
    private let menuTitleModel: [HomeExperienceType] = HomeExperienceType.recommendMenu()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
        menuCollectionVieww.do {
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

        self.addSubviews(menuCollectionVieww)
        
        menuCollectionVieww.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 42 / 812)
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        
    }
}

extension ExamView {
    
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

extension ExamView {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = SizeLiterals.Screen.screenWidth * CGFloat(labelWidthSize(index: indexPath.row) + 23) / 375
        let height = SizeLiterals.Screen.screenHeight <= 800 ? CGFloat(34) : CGFloat(42)
        print("-=--")
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
