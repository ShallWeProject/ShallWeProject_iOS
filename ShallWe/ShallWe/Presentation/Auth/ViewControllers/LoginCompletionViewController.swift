//
//  LoginCompletionViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/16/23.
//

import UIKit

final class LoginCompletionViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let authCompletionView = AuthCompletionView(frame: .zero, mainText: I18N.Auth.loginCompletionText)

    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = authCompletionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension LoginCompletionViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        (view as! AuthCompletionView).setAddTarget()
    }
}
