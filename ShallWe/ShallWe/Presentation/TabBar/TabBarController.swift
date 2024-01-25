//
//  TabBarController.swift
//  ShallWe
//
//  Created by KJ on 11/28/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
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
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // 선택된 탭의 인덱스를 가져옵니다.
        if let index = tabBar.items?.firstIndex(of: item) {
            // 각 탭에 대한 동작을 정의합니다.
            switch index {
            case 0:
                // 첫 번째 탭을 선택했을 때 기존 뷰를 숨깁니다.
                showAnotherViewController()
            default:
                break
            }
        }
    }
}

extension TabBarController {
    
    private func setTabBarItems() {
        
        let categoryVC = UINavigationController(rootViewController: HomeViewController())
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let mypageVC = UINavigationController(rootViewController: MyPageViewController())
        
        tabs = [
            categoryVC,
            homeVC,
            mypageVC
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
    
    func showAnotherViewController() {
        let vc = UINavigationController(rootViewController: CategoryViewController())
        vc.modalPresentationStyle = .overCurrentContext
        // 현재 뷰컨트롤러를 모달로 띄웁니다.
        self.present(vc, animated: false, completion: nil)
    }
}

extension TabBarController {
    
    func bottomInset() -> CGFloat {
        return self.tabBar.frame.size.height + self.safeAreaBottomInset()
    }
}


