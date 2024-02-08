//
//  SignUpCompletionViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/16/23.
//

import UIKit

final class SignUpCompletionViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let authCompletionView = AuthCompletionView(frame: .zero, mainText: I18N.Auth.signupCompletionText)

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

extension SignUpCompletionViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        (view as! AuthCompletionView).setAddTarget()
    }
}

