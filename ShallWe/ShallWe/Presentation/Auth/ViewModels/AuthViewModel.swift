//
//  AuthViewModel.swift
//  ShallWe
//
//  Created by 김나연 on 2/12/24.
//

import Foundation

import AuthenticationServices
import KakaoSDKAuth
import RxCocoa
import RxSwift

final class AuthViewModel: NSObject, AuthViewModelInputs, AuthViewModelOutputs, AuthViewModelType {
    
    // MARK: - Properties
    /// Apple
    private var user: String?
    private var authorizationCode: String?
    private var identityToken: String?
    
    /// Kakao
    private var userID: String?
    private var email: String?
    
    var inputStatus = PublishRelay<InputStatus?>()
    var inputs: AuthViewModelInputs { return self }
    var outputs: AuthViewModelOutputs { return self }
    
    override init() {}
    
    // MARK: - Methods
    
    func inputStateDidChange(state: InputStatus) {
        inputStatus.accept(state)
    }
    
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

protocol AuthViewModelInputs {
    func inputStateDidChange(state: InputStatus)
    // beginediting때(키보드 올라올때) 포지션 조정
    // 인증번호 입력 시 글자수 제한 (6개)
}

protocol AuthViewModelOutputs {
    var inputStatus: PublishRelay<InputStatus?> { get }
}

protocol AuthViewModelType {
    var inputs: AuthViewModelInputs { get }
    var outputs: AuthViewModelOutputs { get }
}

enum InputStatus {
    case entered
    case empty
}
