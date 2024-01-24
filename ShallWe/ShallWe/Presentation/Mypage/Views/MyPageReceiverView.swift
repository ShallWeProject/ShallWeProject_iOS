//
//  MyPageReceiverView.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import UIKit

import SnapKit

final class MyPageReceiverView: UIView {

    // MARK: - UI Components
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isUserInteractionEnabled = true
        collectionView.allowsSelection = true
        collectionView.isScrollEnabled = true
        collectionView.allowsMultipleSelection = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MyPageReceiverView {

    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubview(collectionView)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        MyPageReceiverCollectionViewCell.register(collectionView: collectionView)
    }
}
