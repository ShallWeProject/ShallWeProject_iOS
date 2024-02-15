//
//  AuthResponseDto.swift
//  ShallWe
//
//  Created by 김나연 on 2/15/24.
//

import Foundation

struct AuthResponseDto: Codable {
    let accessToken: String
    let refreshToken: String
    let tokenType: String
}
