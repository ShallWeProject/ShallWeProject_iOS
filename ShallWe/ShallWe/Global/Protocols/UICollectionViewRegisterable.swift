//
//  UICollectionViewRegisterable.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/02.
//

import UIKit

public protocol UICollectionViewRegisterable where Self: UICollectionViewCell {
    static func register(collectionView: UICollectionView)
    static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self
    static var reuseIdentifier: String { get }
}

extension UICollectionViewRegisterable {
    public static func register(collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    public static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? Self else { fatalError()}
        return cell
    }
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

