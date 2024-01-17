//
//  UIButton+.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import UIKit

extension UIButton {
    
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: state)
    }
    
    func makeRoundBorder(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor ) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    
    func set(image: UIImage?, withTitle title: String?, forState state: UIControl.State, additionalSpacing: CGFloat = 0.0, stateSpacing: CGFloat = 0.0) {
        self.setTitle(title, for: state)
        self.setImage(image, for: state)
        
        guard let imageView = self.imageView, let titleLabel = self.titleLabel else { return }
        
        let imageWidth = imageView.frame.width
        let imageHeight = imageView.frame.height
        let titleWidth = titleLabel.frame.width
        let titleHeight = titleLabel.frame.height
        
        let totalWidth = imageWidth + titleWidth + additionalSpacing
        let totalHeight = max(imageHeight, titleHeight)
        
        imageEdgeInsets = .zero
        titleEdgeInsets = .zero
        contentEdgeInsets = .zero
        
        imageEdgeInsets.right = -titleHeight - additionalSpacing / 2 + 4
        
        titleEdgeInsets.left = imageHeight + additionalSpacing / 2 + 8
        contentEdgeInsets.right = stateSpacing
        semanticContentAttribute = .forceRightToLeft
        
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
    }
}

