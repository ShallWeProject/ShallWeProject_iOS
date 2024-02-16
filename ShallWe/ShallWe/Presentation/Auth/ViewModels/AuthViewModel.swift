//
//  AuthViewModel.swift
//  ShallWe
//
//  Created by 김나연 on 2/12/24.
//

import Foundation

import AuthenticationServices
import KakaoSDKAuth

final class AuthViewModel: NSObject {
    
    private var user: String = ""
    private var authorizationCode: Data = Data()
    private var identityToken: Data = Data()
    
    override init() {}
}

// MARK: - Extensions

extension AuthViewModel {
    func loginWithKakao(oauthToken: OAuthToken) {
        // TODO: 로그인 성공 시 키체인에 토큰 저장 후 홈으로 이동, 실패 시 회원가입 진행
    }
    
    func loginWithApple(completion: @escaping (ASAuthorizationAppleIDRequest) -> Void) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = []
        completion(request)
    }
}

extension AuthViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        self.user = credential.user
        self.identityToken = credential.identityToken!
        self.authorizationCode = credential.authorizationCode!
        
        AuthAPI.shared.signInWithApple(user: user) { response in
            // TODO: 로그인 성공 시 키체인에 토큰 저장 후 홈으로 이동, 실패 시 회원가입 진행
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("❗️Apple login failed - \(error.localizedDescription)")
    }
}
