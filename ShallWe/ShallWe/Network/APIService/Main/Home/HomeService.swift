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
    case getSearch(title: String)
}

extension HomeTarget: BaseTargetType {
    
    var path: String {
        switch self {
        case .getExperienceGift:
            return URLConstant.experienceGift
        case .getSearch:
            return URLConstant.experienceGiftSearch
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getExperienceGift:
            return .requestPlain
        case .getSearch(let title):
            let param: [String: Any] = [
                URLConstant.experienceGiftSearch : title
            ]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return APIConstants.headerWithAuthorization
        }
    }
}
