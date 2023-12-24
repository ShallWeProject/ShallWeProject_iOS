//
//  HomeExperienceListView.swift
//  ShallWe
//
//  Created by KJ on 12/13/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class HomeExperienceListView: BaseView {
    
    // MARK: - UI Components

    lazy var homelistCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    // MARK: - Properties
    
    private let dispoeBag = DisposeBag()
    private let viewModel = HomeExperienceListViewModel()
    private let dummyModel = HomeExperienceModel.homeExperienceDummyData()
    private lazy var activateDropDownAlert = ActivateDropDownAlert()

    
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
            $0.top.equalToSuperview().inset(13)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        homelistCollectionView.delegate = self
        homelistCollectionView.dataSource = self
        homelistCollectionView.registerCell(HomeExperienceCell.self)
        homelistCollectionView.registerHeader(ExperienceHeader.self)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 37.0) // 헤더 뷰의 폭과 높이를 설정
    }
}

extension HomeExperienceListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: HomeExperienceCell.self, indexPath: indexPath)
        cell.configureCell(dummyModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableCell(kind: kind, type: ExperienceHeader.self, indexPath: indexPath)
        header.dropDownButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.viewModel.inputs.dropDownButtonTap(at: header.titleType)
                print("tap")
                self.addSubview(activateDropDownAlert)
                self.activateDropDownAlert.snp.makeConstraints {
                    $0.edges.equalToSuperview()
                }
            })
            .disposed(by: dispoeBag)
        return header
    }
}
