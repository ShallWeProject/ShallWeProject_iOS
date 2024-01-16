//
//  HomeExperienceView.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

final class HomeCategoryView: BaseView {

    // MARK: - UI Components
    
    lazy var menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: menuCollectionFlowLayout)
    lazy var pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                               navigationOrientation: .horizontal)
    private let menuCollectionFlowLayout = UICollectionViewFlowLayout()
    var menuVCs: [UIViewController] = ExperiencePageVC.categoryPageVC(HomeExperienceViewModel())
    
    // MARK: - UI Components Property
    
    private let menuTitleModel: [HomeExperienceType] = HomeExperienceType.categoryMenu()
    var nowIndex: Int = 0 {
        didSet {
            pageBind(oldValue: oldValue, newValue: nowIndex)
        }
    }
    
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
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 42 / 812)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        menuCollectionView.delegate = self
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
}

extension HomeCategoryView {
    
    func labelWidthSize(index: Int) -> Int {
        let size = menuTitleModel[index].type.size(
            withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)]).width
        return Int(size)
    }
    
    private func cellUnderLineSetting(cell: HomeMenuCollectionViewCell?, indexPath: IndexPath, selected: Bool) {
        cell?.isSelected = selected
        cell?.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
    }
    
    func pageBind(oldValue: Int, newValue: Int) {
        let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward : .reverse
        pageViewController.setViewControllers([menuVCs[nowIndex]], direction: direction, animated: true)
        menuCollectionView.selectItem(at: IndexPath(item: nowIndex, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func didTapCell(at indexPath: IndexPath) {
        nowIndex = indexPath.item
    }
    
    private func setViewControllersInPageVC() {
        if let firstVC = menuVCs.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension HomeCategoryView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = SizeLiterals.Screen.screenWidth * CGFloat(labelWidthSize(index: indexPath.row) + 23) / 375
        let height = SizeLiterals.Screen.screenHeight <= 800 ? CGFloat(34) : CGFloat(42)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = SizeLiterals.Screen.screenWidth * 30 / 375
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let myCell = cell as? HomeMenuCollectionViewCell {
            myCell.underLine.isHidden = !myCell.isSelected
            myCell.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
        }
    }
}


extension HomeCategoryView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = menuVCs.firstIndex(of: currentVC) else { return }
        nowIndex = currentIndex
        print(currentIndex)
    }
}

extension HomeCategoryView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = menuVCs.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return menuVCs[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = menuVCs.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == menuVCs.count {
            return nil
        }
        return menuVCs[nextIndex]
    }
}
