//
//  AuthTarget.swift
//  ShallWe
//
//  Created by 김나연 on 2/15/24.
//

import Foundation

import Moya

enum AuthTarget {
    case signInWithApple(signInWithAppleRequestDto: SignInWithAppleRequestDto)
    case signInWithKakao(signInWithKakaoRequestDto: SignInWithKakaoRequestDto)
}

extension AuthTarget: BaseTargetType {
    var path: String {
        switch self {
            // TODO: auth api 확정되면 수정 필요
        case .signInWithApple, .signInWithKakao:
            return URLConstant.signIn
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signInWithApple, .signInWithKakao:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signInWithApple(let signInRequestDto):
            return .requestJSONEncodable(signInRequestDto)
        case .signInWithKakao(let signInRequestDto):
            return .requestJSONEncodable(signInRequestDto)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return APIConstants.headerWithOutToken
        }
    }
}
