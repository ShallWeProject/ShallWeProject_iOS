//
//  MemoryPhotoAlbumViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/27/24.
//

import UIKit

final class MemoryPhotoAlbumViewController: UIViewController {

    // MARK: - UI Components
    
    private let memoryPhotoAlbumView = MemoryPhotoAlbumView()
    private lazy var collectionView = memoryPhotoAlbumView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = memoryPhotoAlbumView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setAddTarget()
        setDelegate()
    }
}

// MARK: - Extensions

extension MemoryPhotoAlbumViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        memoryPhotoAlbumView.navigationBar.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Actions
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MemoryPhotoAlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (SizeLiterals.Screen.screenWidth - (24 * 2 + 18)) / 2
        let height = width
        return CGSize(width: width, height: height)
    }
}

extension MemoryPhotoAlbumViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)")
    }
}

extension MemoryPhotoAlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MemoryPhotoAlbumCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.configure(index: indexPath.item)
        return cell
    }
}
