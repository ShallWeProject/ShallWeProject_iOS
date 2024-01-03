//
//  RecentSearchView.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit

final class RecentSearchView: UIView {

    // MARK: - UI Components
    
    private let recentSearchLabel = UILabel()
    private let deleteAllButton = UIButton()
    private lazy var recentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()

}
