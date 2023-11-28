//
//  TabBarItem.swift
//  ShallWe
//
//  Created by KJ on 11/28/23.
//

import UIKit

enum TabBarItemType: Int, CaseIterable {
    case category
    case home
    case mypage
}

extension TabBarItemType {
    
    var unSelectedIcon: UIImage {
        switch self {
        case .category:
            return ImageLiterals.TabBar.category
        case .home:
            return ImageLiterals.TabBar.home
        case .mypage:
            return ImageLiterals.TabBar.mypage
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .category:
            return ImageLiterals.TabBar.category_selected
        case .home:
            return ImageLiterals.TabBar.home_selected
        case .mypage:
            return ImageLiterals.TabBar.mypage_selected
        }
    }
    
    public func setTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "", image: unSelectedIcon, selectedImage: selectedIcon)
    }
}
