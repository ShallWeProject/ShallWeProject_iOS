//
//  AuthViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/5/23.
//

import UIKit

import AuthenticationServices
import KakaoSDKAuth
import KakaoSDKUser

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let authViewModel = AuthViewModel()
    
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
    
    private func goToPhoneNumberVerificationVC() {
        let phoneNumberVerificationViewController = PhoneNumberVerificationViewController()
        self.navigationController?.pushViewController(phoneNumberVerificationViewController, animated: true)
    }
    
    private func signInWithKakao(_ error: Error?, _ oauthToken: OAuthToken?) {
        if let error = error {
            print("❗️카카오 로그인 실패 - \(error)")
        }
        else {
            print("✅ 카카오 로그인 성공")
            if let oauthToken = oauthToken {
                self.authViewModel.signInWithKakao(oauthToken: oauthToken) { response in
                    
                }
            }
        }
    }
    
    // MARK: Actions
    
    @objc
    func kakaoLoginDidTap() {
        print("💛")
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                self.signInWithKakao(error, oauthToken)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                self.signInWithKakao(error, oauthToken)
            }
        }
    }
    
    @objc
    func appleLoginDidTap() {
        print("🍎")
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = []
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        print("✅ 애플 로그인 성공")
        authViewModel.user = credential.user
        authViewModel.identityToken = credential.identityToken!
        authViewModel.authorizationCode = credential.authorizationCode!
        
        authViewModel.signInWithApple { reponse in
            
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("❗️Apple login failed - \(error.localizedDescription)")
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
