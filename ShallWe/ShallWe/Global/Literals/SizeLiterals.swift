//
//  SizeLiterals.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import UIKit

struct SizeLiterals {
    
    struct Screen {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let deviceRatio: CGFloat = screenWidth / screenHeight
    }
}

extension UIViewController {
    var tabBarHeight: CGFloat {
        if let tabBarHeight = self.tabBarController?.tabBar.frame.size.height {
            return tabBarHeight
        }
        return 49
    }
}
