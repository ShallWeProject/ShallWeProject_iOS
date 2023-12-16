//
//  LoginCompletionViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/16/23.
//

import UIKit

final class LoginCompletionViewController: UIViewController {

    override func loadView() {
        super.loadView()
        view = AuthCompletionView(frame: .zero, mainText: I18N.Auth.loginCompletionText)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
