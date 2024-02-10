//
//  ExperienceTarget.swift
//  ShallWe
//
//  Created by 고아라 on 2/10/24.
//

import Foundation

import Moya

enum ExperienceTarget {
    case getExperienceDetail(experienceGiftId: Int)
}

extension ExperienceTarget: BaseTargetType {

    var path: String {
        switch self {
        case .getExperienceDetail(experienceGiftId: let experienceGiftId):
            let path = URLConstant.experienceDetails
                .replacingOccurrences(of: "{ExperienceGiftId}", with: String(experienceGiftId))
            return path
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getExperienceDetail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getExperienceDetail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return APIConstants.headerWithAuthorization
    }
}
