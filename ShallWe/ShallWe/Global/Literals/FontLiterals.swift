//
//  FontLiterals.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import UIKit

enum AppleSDGothicNeoType: String {
    case EB = "AppleSDGothicNeoEB00"
    case B = "AppleSDGothicNeoB00"
    case SB = "AppleSDGothicNeoSB00"
    case M = "AppleSDGothicNeoM00"
    case R = "AppleSDGothicNeoR00"
}

enum AbhayaLibreType: String {
    case FAQ = "AbhayaLibre-ExtraBold"
}

enum FontLevel {
    case R00_10
    case R00_12
    case R00_14
    
    case M00_12
    case M00_12_20
    case M00_12_underlined
    case M00_14
    
    case SB00_12
    case SB00_14
    case SB00_16
    case SB00_16_23
    case SB00_18
    
    case B00_12
    case B00_14
    case B00_16
    case B00_20
    
    case EB00_14
    
    case faq_20
}

extension FontLevel {
    
    var fontWeight: String {
        switch self {
        case .R00_10, .R00_12, .R00_14:
            return AppleSDGothicNeoType.R.rawValue
        case .M00_12, .M00_12_20, .M00_12_underlined, .M00_14:
            return AppleSDGothicNeoType.M.rawValue
        case .SB00_12, .SB00_14, .SB00_16, .SB00_16_23, .SB00_18:
            return AppleSDGothicNeoType.SB.rawValue
        case .B00_12, .B00_14, .B00_16, .B00_20:
            return AppleSDGothicNeoType.B.rawValue
        case .EB00_14:
            return AppleSDGothicNeoType.EB.rawValue
        case .faq_20:
            return AbhayaLibreType.FAQ.rawValue
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .R00_10:
            return 10
        case .R00_12, .M00_12, .M00_12_20, .M00_12_underlined, .SB00_12, .B00_12:
            return 12
        case .R00_14, .M00_14, .SB00_14, .B00_14, .EB00_14:
            return 14
        case .SB00_16, .SB00_16_23, .B00_16:
            return 16
        case .SB00_18:
            return 18
        case .B00_20, .faq_20:
            return 20
        }
    }
    
    var lineHeihgt: CGFloat? {
        switch self {
        case .M00_12_20, .M00_12_underlined, .SB00_14, .SB00_16:
            return 20
        case .SB00_16_23:
            return 23
        case .SB00_18:
            return 18
        case .B00_16:
            return 23
        case .faq_20:
            return 28
        default:
            return nil
        }
    }
}

extension UIFont {
    
    static func fontGuide(_ fontLevel: FontLevel) -> UIFont {
        let baseFont = UIFont(name: fontLevel.fontWeight, size: fontLevel.fontSize)!
        return baseFont
    }
}
