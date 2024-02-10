//
//  BaseTargetType.swift
//  ShallWe
//
//  Created by KJ on 2/9/24.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
}
