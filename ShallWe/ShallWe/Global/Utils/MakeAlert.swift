//
//  MakeAlert.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import UIKit

extension UIViewController {
    
    func makeAlert(title: String,
                   message: String,
                   okAction: ((UIAlertAction) -> Void)? = nil,
                   completion: (() -> Void)? = nil) {
        makeVibrate()
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        okAction.setValue(UIColor.black0, forKey: "titleTextColor")
        alertViewController.addAction(okAction)
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    func makeAlert(title: String,
                   message: String,
                   okTitle: String,
                   okAction: ((UIAlertAction) -> Void)? = nil,
                   completion: (() -> Void)? = nil) {
        makeVibrate()
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okAction)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        self.present(alertViewController, animated: true, completion: completion)
    }

    func makeTwoButtonAlert(title: String,
                            message: String,
                            leftTitle: String,
                            rightTitle: String,
                            leftAction: (() -> Void)? = nil,
                            rightAction: (() -> Void)? = nil,
                            completion: (() -> Void)? = nil) {
        makeVibrate()
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let leftAction = UIAlertAction(title: leftTitle, style: .default) { _ in
            leftAction?()
        }
        leftAction.setValue(UIColor.black0, forKey: "titleTextColor")
        alertViewController.addAction(leftAction)
        
        let rightAction = UIAlertAction(title: rightTitle, style: .default) { _ in
            rightAction?()
        }
        rightAction.setValue(UIColor.black0, forKey: "titleTextColor")
        alertViewController.addAction(rightAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
