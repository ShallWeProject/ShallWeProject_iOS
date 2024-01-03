//
//  RecentSearchView.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class RecentSearchView: BaseView {

    // MARK: - UI Components
    
    private let recentSearchLabel = UILabel()
    let deleteAllButton = UIButton()
    lazy var recentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .clear
        
        recentSearchLabel.do {
            $0.text = I18N.Search.recentSearch
            $0.font = .fontGuide(.M00_12)
            $0.textColor = .gray4
        }
        
        deleteAllButton.do {
            $0.setTitle(I18N.Search.deleteAll, for: .normal)
            $0.titleLabel?.font = .fontGuide(.M00_12)
            $0.setTitleColor(.gray4, for: .normal)
        }
        
        recentCollectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.scrollDirection = .vertical
            $0.minimumLineSpacing = 5
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.addSubviews(recentSearchLabel, deleteAllButton, recentCollectionView)
        
        recentSearchLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(28)
        }
        
        deleteAllButton.snp.makeConstraints {
            $0.top.equalTo(recentSearchLabel)
            $0.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(28)
        }
        
        recentCollectionView.snp.makeConstraints {
            $0.top.equalTo(recentSearchLabel.snp.bottom).offset(8)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        recentCollectionView.registerCell(RecentSearchCollectionViewCell.self)
    }
}

extension RecentSearchView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width - 48, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
}

extension RecentSearchView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentSearchModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: RecentSearchCollectionViewCell.self, indexPath: indexPath)
        cell.deleteButton.rx.tap
            .flatMapLatest { [weak self] _ -> Observable<IndexPath> in
                guard let indexPath = self?.recentCollectionView.indexPath(for: cell) else {
                    return Observable.empty()
                }
                return Observable.just(indexPath)
            }
            .subscribe(onNext: { [weak self] indexPath in
                if indexPath.row >= 0 && indexPath.row < recentSearchModel.count {
                    recentSearchModel.remove(at: indexPath.row)
                    self?.recentCollectionView.reloadData()
                    print(recentSearchModel)
                    if recentSearchModel.isEmpty {
                        searchTypeRelay.accept(.clear)
                    }
                }
            })
            .disposed(by: disposeBag)
        cell.configureCell(recentSearchModel[indexPath.row])
        return cell
    }
}
