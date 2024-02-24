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

protocol AuthViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}

enum InputStatus {
    case entered
    case empty
}

final class AuthViewModel: NSObject, AuthViewModelType {
    
    // MARK: - Properties
    /// Apple
    private var user: String?
    private var authorizationCode: String?
    private var identityToken: String?
    
    /// Kakao
    private var userID: String?
    private var email: String?
    
    struct Input {
        var nameTextFieldDidChange: PublishRelay<InputStatus>
        var phoneNumberTextFieldDidChange: PublishRelay<InputStatus>
        var isVerificationCompleted: PublishRelay<Bool>
    //    func verificationCodeCharsDidChange(text: String)
    }

    struct Output {
        var isAllEntered: Driver<Bool>
    //    var numberOfverificationCodeChars: PublishRelay<String> { get }
    }
    
    var input: Input
    var output: Output
    
    override init() {
        let nameTextFieldDidChange = PublishRelay<InputStatus>()
        let phoneNumberTextFieldDidChange = PublishRelay<InputStatus>()
        let isVerificationCompleted = PublishRelay<Bool>()
        let isAllEntered = Observable
            .combineLatest(nameTextFieldDidChange, phoneNumberTextFieldDidChange, isVerificationCompleted)
            .map { values in
                return values.0 == InputStatus.entered && values.1 == InputStatus.entered && values.2
            }
            .asDriver(onErrorJustReturn: false)
        
        self.input = Input(
            nameTextFieldDidChange: nameTextFieldDidChange,
            phoneNumberTextFieldDidChange: phoneNumberTextFieldDidChange,
            isVerificationCompleted: isVerificationCompleted
        )
        self.output = Output(
            isAllEntered: isAllEntered
        )
    }
    
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
