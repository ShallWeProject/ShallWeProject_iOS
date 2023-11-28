//
//  ColorLiterals.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import UIKit

extension UIColor {
    
    // MARK: - Pink
    
    static var main: UIColor {
        return UIColor(hex: "#E31B54")
    }
    
    static var point: UIColor {
        return UIColor(hex: "#F15F79")
    }
    
    static var point_50: UIColor {
        return UIColor(hex: "#F15F79").withAlphaComponent(0.5)
    }
    
    static var line1: UIColor {
        return UIColor(hex: "#F2AAB7")
    }
    
    // MARK: - GrayScale
    
    static var white: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    
    static var gray0: UIColor {
        return UIColor(hex: "#F6F6F6")
    }
    
    static var gray1: UIColor {
        return UIColor(hex: "#F2F2F2")
    }
    
    static var gray3: UIColor {
        return UIColor(hex: "#B9BEC1")
    }
    
    static var gray4: UIColor {
        return UIColor(hex: "#949494")
    }
    
    static var black: UIColor {
        return UIColor(hex: "#000000")
    }
    
    static var black0: UIColor {
        return UIColor(hex: "#454545")
    }
    
    static var black_50: UIColor {
        return UIColor(hex: "#000000").withAlphaComponent(0.5)
    }
    
    // MARK: - Background
    
    static var bg0: UIColor {
        return UIColor(hex: "#FFFBFB")
    }
    
    static var bg1: UIColor {
        return UIColor(hex: "#FFFAFB")
    }
    
    static var bg2: UIColor {
        return UIColor(hex: "#FFF5F5")
    }
    
    static var bg3: UIColor {
        return UIColor(hex: "#FFF5F5").withAlphaComponent(0.95)
    }
    
    static var bg4: UIColor {
        return UIColor(hex: "#FFE4E8")
    }
}
