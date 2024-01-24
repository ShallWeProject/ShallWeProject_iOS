//
//  MyPageViewController.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import UIKit

final class MyPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let receiverDummy = MyPageReceiverEntity.receiveDummy()
    
    // MARK: - UI Components
    
    private let myPageView = MyPageView()
    private lazy var collectionview = myPageView.mypageReceiverView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions

extension MyPageViewController {

    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        collectionview.delegate = self
        collectionview.dataSource = self
    }
}

extension MyPageViewController: UICollectionViewDelegate {
}

extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: SizeLiterals.Screen.screenWidth * 329 / 375, height: 108)
        } else {
            return CGSize(width: SizeLiterals.Screen.screenWidth * 329 / 375, height: 340)
        }
    }
}

extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MyPageReceiverCollectionViewCell.dequeueReusableCell(collectionView: collectionview, indexPath: indexPath)
        cell.setDataBind(model: receiverDummy[indexPath.item])
        return cell
    }
}

// MARK: - Network

extension MyPageViewController {

    func getAPI() {
        
    }
}
