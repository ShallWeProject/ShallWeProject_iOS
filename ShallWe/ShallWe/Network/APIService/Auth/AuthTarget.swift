//
//  AuthTarget.swift
//  ShallWe
//
//  Created by 김나연 on 2/15/24.
//

import Foundation

import Moya

enum AuthTarget {
    case signUpWithApple(signUpWithAppleRequestDto: SignUpWithAppleRequestDto)
    case signInWithApple
}

extension AuthTarget: BaseTargetType {
    var path: String {
        switch self {
            // TODO: 애플용 auth api 추가되면 수정 필요
        case .signUpWithApple:
            return URLConstant.signUp
        case .signInWithApple:
            return URLConstant.signIn
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUpWithApple, .signInWithApple:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUpWithApple(let signUpRequestDto):
            return .requestJSONEncodable(signUpRequestDto)
        case .signInWithApple:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return APIConstants.headerWithOutToken
        }
    }
}
