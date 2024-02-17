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
    
    // MARK: - Properties
    /// Apple
    private var user: String?
    private var authorizationCode: String?
    private var identityToken: String?
    
    /// Kakao
    private var userID: String?
    private var email: String?
    
    override init() {}
    
    // MARK: - Methods
    
    func signUpWithKakao() {
        
    }
    
    func signUpWithApple() {
        
    }
    
    func setSignUpDataWithApple(user: String, authorizationCode: String, identityToken: String) {
        self.user = user
        self.authorizationCode = authorizationCode
        self.identityToken = identityToken
    }
    
    func setSignUpDataWithKakao(userID: String, email: String) {
        self.userID = userID
        self.email = email
    }
}

// MARK: - Extensions

extension AuthViewModel {
    func signInWithKakao(completion: @escaping (Any) -> Void) {
        AuthAPI.shared.signInWithKakao() { response in
            completion(response as Any)
            // TODO: 로그인 성공 시 키체인에 토큰 저장 후 로그인VC에서 홈으로 이동, 실패 시 회원가입 진행
        }
    }
    
    func signInWithApple(completion: @escaping (Any) -> Void) {
        AuthAPI.shared.signInWithApple() { response in
            completion(response as Any)
            // TODO: 로그인 성공 시 키체인에 토큰 저장 후 로그인VC에서 홈으로 이동, 실패 시 회원가입 진행
        }
    }
}
