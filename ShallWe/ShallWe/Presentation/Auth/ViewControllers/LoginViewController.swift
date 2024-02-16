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
                UserApi.shared.me() { (user, error) in
                    if let error = error {
                        print("❗️유저 정보 가져오기 실패 - \(error)")
                    } else {
                        if let user = user {
                            self.authViewModel.setSignUpDataWithKakao(userID: String(describing: user.id), email: user.kakaoAccount?.email ?? "", accessToken: oauthToken.accessToken)
                            
                            self.authViewModel.signInWithKakao { response in
                                self.goToPhoneNumberVerificationVC()
                            }
                        }
                    }
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
        let authorizationCode = String(data: credential.authorizationCode ?? Data(), encoding: .utf8) ?? ""
        let identityToken = String(data: credential.identityToken ?? Data(), encoding: .utf8) ?? ""
        authViewModel.setSignUpDataWithApple(user: credential.user, authorizationCode: authorizationCode, identityToken: identityToken)
        
        authViewModel.signInWithApple { reponse in
            self.goToPhoneNumberVerificationVC()
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
