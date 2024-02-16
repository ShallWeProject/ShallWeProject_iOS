//
//  Config.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let kakaoNativeAppKey = "KAKAO_NATIVE_APP_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
    
    static let kakaoNativeAppKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.kakaoNativeAppKey] as? String else {
            fatalError("Kakao Native App Key is not set in plist for this configuration.")
        }
        return key
    }()
}
