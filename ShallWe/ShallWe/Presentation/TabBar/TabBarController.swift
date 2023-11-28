//
//  TabBarController.swift
//  ShallWe
//
//  Created by KJ on 11/28/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private let tabBarHeight: CGFloat = SizeLiterals.Screen.screenHeight * 86 / 812
    private var tabs: [UIViewController] = []
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarUI()
        setTabBarItems()
        setTabBarHeight()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension TabBarController {
    
    private func setTabBarItems() {
        
        tabs = [
            CategoryViewController(),
            HomeViewController(),
            MypageViewController()
        ]
        
        TabBarItemType.allCases.forEach {
            let tabBarItem = $0.setTabBarItem()
            tabs[$0.rawValue].tabBarItem = tabBarItem
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: false)
        selectedViewController = tabs[1]
    }
    
    private func setTabBarUI() {
        UITabBar.clearShadow()
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 0.7
        tabBar.tintColor = .main
    }
    
    private func setTabBarHeight() {
        if let tabBar = self.tabBarController?.tabBar {
            let safeAreaBottomInset = self.view.safeAreaInsets.bottom
            let tabBarHeight = tabBar.bounds.height
            let newTabBarFrame = CGRect(x: tabBar.frame.origin.x, y: tabBar.frame.origin.y - safeAreaBottomInset, width: tabBar.frame.width, height: tabBarHeight + safeAreaBottomInset)
            tabBar.frame = newTabBarFrame
        }
    }
}

