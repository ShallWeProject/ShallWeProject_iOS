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
    
    var user: String = ""
    var authorizationCode: Data = Data()
    var identityToken: Data = Data()
    
    override init() {}
    
    func signUpWithKakao() {
        
    }
    
    func signUpWithApple() {
        
    }
}

// MARK: - Extensions

extension AuthViewModel {
    func signInWithKakao(oauthToken: OAuthToken, completion: @escaping (Any) -> Void) {
        AuthAPI.shared.signInWithKakao(oauthToken: oauthToken) { response in
            // TODO: 로그인 성공 시 키체인에 토큰 저장 후 로그인VC에서 홈으로 이동, 실패 시 회원가입 진행
        }
    }
    
    func signInWithApple(completion: @escaping (Any) -> Void) {
        AuthAPI.shared.signInWithApple(user: user) { response in
            completion(response as Any)
            // TODO: 로그인 성공 시 키체인에 토큰 저장 후 로그인VC에서 홈으로 이동, 실패 시 회원가입 진행
        }
    }
}
