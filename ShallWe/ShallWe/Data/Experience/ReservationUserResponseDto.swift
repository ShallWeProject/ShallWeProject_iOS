//
//  ReservationUserResponseDto.swift
//  ShallWe
//
//  Created by 고아라 on 2/20/24.
//

import Foundation

struct ReservationUserResponseDto: Codable {
    let id, senderID, ownerID: Int
    let sender: String
    let persons: Int
    let date, time: String
    let experienceGiftID: Int
    let receiver, phoneNumber, invitationImageURL, invitationComment: String
    let reservationStatus: String

    enum CodingKeys: String, CodingKey {
        case id
        case senderID = "senderId"
        case ownerID = "ownerId"
        case sender, persons, date, time
        case experienceGiftID = "experienceGiftId"
        case receiver, phoneNumber, invitationImageURL, invitationComment, reservationStatus
    }
}

extension ReservationUserResponseDto {
    
    static func reservationUserInitValue() -> ReservationUserResponseDto {
        return ReservationUserResponseDto(id: 0, senderID: 0, ownerID: 0, sender: "", persons: 0, date: "", time: "", experienceGiftID: 0, receiver: "", phoneNumber: "", invitationImageURL: "", invitationComment: "", reservationStatus: "")
    }
}
