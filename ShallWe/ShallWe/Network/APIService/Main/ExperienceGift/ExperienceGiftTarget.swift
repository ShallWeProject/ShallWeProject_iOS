//
//  ExperienceTarget.swift
//  ShallWe
//
//  Created by KJ on 2/25/24.
//

import Foundation

import Moya

enum ExperienceGiftTarget {
    case getSttCategory(categoryId: Int, category: String)
    case getExpCategory(categoryId: Int, category: String)
    case getPopular
}

extension ExperienceGiftTarget: BaseTargetType {
    
    var path: String {
        switch self {
        case .getSttCategory(let categoryId, _):
            return URLConstant.experienceGiftSttCategory.replacingOccurrences(of: "{SttCategoryId}", with: String(categoryId))
        case .getExpCategory(let categoryId, _):
            return URLConstant.experienceExpCategory.replacingOccurrences(of: "{ExpCategoryId}", with: String(categoryId))
        case .getPopular:
            return URLConstant.experienceGiftPopular
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
        case .getSttCategory(_, category: let category):
            let param: [String: Any] = [
                URLConstant.experienceGiftSttCategory : category
            ]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getExpCategory(_, category: let category):
            let param: [String: Any] = [
                URLConstant.experienceExpCategory : category
            ]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getPopular:
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
