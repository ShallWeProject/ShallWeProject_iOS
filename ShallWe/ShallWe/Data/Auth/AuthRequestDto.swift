//
//  AuthRequestDto.swift
//  ShallWe
//
//  Created by 김나연 on 2/15/24.
//

import Foundation

struct SignUpWithAppleRequestDto: Codable {
    let authorizationCode: String
    let identityToken: String
    let user: String
}

struct SignUpWithKakaoRequestDto: Codable {
    let providerID: String
    let email: String
}

struct SignInWithAppleRequestDto: Codable {
    let user: String
}

struct SignInWithKakaoRequestDto: Codable {
    let providerID: String
    let email: String
}
