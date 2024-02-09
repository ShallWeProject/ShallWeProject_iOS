//
//  APIConstant.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import Foundation

enum NetworkHeaderKey: String {
    case deviceToken = "deviceToken"
    case accessToken = "accesstoken"
    case refreshToken = "refreshToken"
    case contentType = "Content-Type"
    case authorization = "Authorization"
}

enum APIConstants {
    
    static let accept: String = "Accept"
    static let auth: String = "x-auth-token"
    static let applicationJSON = "application/json"
    static var deviceToken: String = ""
    static var jwtToken: String = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4IiwiaWF0IjoxNzA3NDYwNTY1LCJleHAiOjUzMDc0NjA1NjV9.PTzsq8qqyOQWmV4QHfEpTuxAnH6_dTWaF5a_CGakt4YC-BD9zjeDZSYtzFHR4z8535EzcXIgGPv8jj3ANsimqg"
    static var refreshToken: String = ""
    
    //MARK: - Header
    
    static var headerWithOutToken: [String: String] {
        [
            NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON
        ]
    }
    
    static var headerWithDeviceToken: [String: String] {
        [
            NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON,
            NetworkHeaderKey.authorization.rawValue: URLConstant.bearer + APIConstants.deviceToken
        ]
    }
    
    static var headerWithAuthorization: [String: String] {
        [
            NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON,
            NetworkHeaderKey.authorization.rawValue: URLConstant.bearer + APIConstants.jwtToken
        ]
    }
    
    static var headerWithRefresh: [String: String] {
        [
            NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON,
            NetworkHeaderKey.authorization.rawValue: URLConstant.bearer + APIConstants.jwtToken,
            NetworkHeaderKey.refreshToken.rawValue: URLConstant.bearer + APIConstants.refreshToken
        ]
    }
}
