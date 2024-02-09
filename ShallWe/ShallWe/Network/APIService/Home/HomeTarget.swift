//
//  HomeService.swift
//  ShallWe
//
//  Created by KJ on 2/9/24.
//

import Foundation

import Moya

enum HomeTarget {
    case getExperienceGift
}

extension HomeTarget: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getExperienceGift:
            return URL(string: URLConstant.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .getExperienceGift:
            return URLConstant.experienceGift
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getExperienceGift:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getExperienceGift:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return APIConstants.headerWithAuthorization
        }
    }
}
