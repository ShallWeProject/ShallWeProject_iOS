//
//  AuthRequestDto.swift
//  ShallWe
//
//  Created by 김나연 on 2/15/24.
//

import Foundation

struct SignUpRequestDto: Codable {
    let email: String
    let authorizationCode: String
    let identityToken: String
    let user: String
}

struct SignInRequestDto: Codable {
    let user: String
}
