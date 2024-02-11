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
        
        setTapRecognizer()
    }
}

// MARK: - Extensions

extension LoginViewController {
    
    // MARK: - Methods
    
    func setTapRecognizer() {
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(kakaoLoginDidTap))
        loginView.kakaoLoginView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(appleLoginDidTap))
        loginView.appleLoginView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func goTophoneNumberVerificationVC() {
        let phoneNumberVerificationViewController = PhoneNumberVerificationViewController()
        self.navigationController?.pushViewController(phoneNumberVerificationViewController, animated: true)
    }
    
    // MARK: Actions
    
    @objc
    func kakaoLoginDidTap() {
        print("💛")
    }
    
    @objc
    func appleLoginDidTap() {
        print("🖤")
    }
}
