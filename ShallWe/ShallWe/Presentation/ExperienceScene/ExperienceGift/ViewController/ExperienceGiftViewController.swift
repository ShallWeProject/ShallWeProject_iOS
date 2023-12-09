//
//  ExperienceGiftViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/05.
//

import UIKit

final class ExperienceGiftViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let experienceGiftView = ExperienceGiftView()
    private lazy var collectionView = experienceGiftView.timeCollectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = experienceGiftView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
}

extension ExperienceGiftViewController {
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ExperienceGiftViewController: UICollectionViewDelegate {
    
}

extension ExperienceGiftViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TimeCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        return cell
    }
}

extension ExperienceGiftViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 51, height: 28)
    }
}
