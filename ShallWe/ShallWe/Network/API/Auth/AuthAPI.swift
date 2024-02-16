//
//  AuthAPI.swift
//  ShallWe
//
//  Created by 김나연 on 2/15/24.
//

import Foundation

import Moya
import KakaoSDKAuth

final class AuthAPI {
    static let shared: AuthAPI = AuthAPI()
    private let authProvider = MoyaProvider<AuthTarget>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    // MARK: - POST
    /// 카카오 회원가입
    func signUpWithKakao(completion: @escaping(GeneralResponse<AuthResponseDto>?) -> Void) {
        
    }
    
    /// 애플 회원가입
    func signUpWithApple(completion: @escaping(GeneralResponse<AuthResponseDto>?) -> Void) {
        
    }
    
    /// 카카오 로그인
    func signInWithKakao(oauthToken: OAuthToken, completion: @escaping(GeneralResponse<AuthResponseDto>?) -> Void) {
        
    }
    
    /// 애플 로그인
    func signInWithApple(user: String, completion: @escaping(GeneralResponse<AuthResponseDto>?) -> Void) {
        
    }
}
