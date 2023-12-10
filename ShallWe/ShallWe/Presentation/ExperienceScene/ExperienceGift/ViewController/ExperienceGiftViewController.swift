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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TimeCollectionViewCell {
            cell.timeLabel.backgroundColor = .point
            cell.timeLabel.textColor = .bg0
        }
        
        for otherIndexPath in collectionView.indexPathsForVisibleItems where otherIndexPath != indexPath {
            if let otherCell = collectionView.cellForItem(at: otherIndexPath) as? TimeCollectionViewCell {
                otherCell.timeLabel.backgroundColor = .bg0
                otherCell.timeLabel.textColor = .gray4
            }
        }
    }
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
