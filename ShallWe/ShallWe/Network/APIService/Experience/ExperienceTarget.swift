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
    case getReservationDate(giftId: Int, date: String)
    case postReservationUser(param: ReservationUserRequestDto)
}

extension ExperienceTarget: BaseTargetType {

    var path: String {
        switch self {
        case .getExperienceDetail(experienceGiftId: let experienceGiftId):
            let path = URLConstant.experienceDetails
                .replacingOccurrences(of: "{ExperienceGiftId}", with: String(experienceGiftId))
            return path
        case .getReservationDate(giftId: let giftId, date: let date):
            return URLConstant.reservationDate
        case .postReservationUser(param: _):
            return URLConstant.reservationUser
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getExperienceDetail:
            return .get
        case .getReservationDate:
            return .get
        case .postReservationUser:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getExperienceDetail:
            return .requestPlain
        case .getReservationDate(giftId: let giftId, date: let date):
            return .requestParameters(parameters: ["giftId": giftId, "date": date],
                                                  encoding: URLEncoding.default)
        case .postReservationUser(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return APIConstants.headerWithAuthorization
    }
}
