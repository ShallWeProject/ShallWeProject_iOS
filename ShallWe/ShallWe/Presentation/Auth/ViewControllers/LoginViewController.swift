//
//  AuthViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/5/23.
//

import UIKit
import AuthenticationServices

final class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
    }
}

// MARK: - Extensions

extension LoginViewController {
    
    // MARK: - Methods
    
    func setAddTarget() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenDidTap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: Actions
    
    @objc func screenDidTap() {
        let phoneNumberVerificationViewController = PhoneNumberVerificationViewController()
        self.navigationController?.pushViewController(phoneNumberVerificationViewController, animated: true)
    }
}
