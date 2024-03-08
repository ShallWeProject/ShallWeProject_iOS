//
//  ReservationUserRequestDto.swift
//  ShallWe
//
//  Created by 고아라 on 2/20/24.
//

import Foundation

struct ReservationUserRequestDto: Codable {
    let experienceGiftID, persons: Int
    let date: String
    let time: String
    let phoneNumber: String
    let imageURL: String
    let invitationComment: String

    enum CodingKeys: String, CodingKey {
        case experienceGiftID = "experienceGiftId"
        case persons, date, time, phoneNumber, imageURL, invitationComment
    }
}
