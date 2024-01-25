//
//  MyPageSenderEntity.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import Foundation

struct MyPageSenderEntity: Codable {
    let reservationID: Int
    let reservationStatus: String
    let experienceGiftID: Int
    let experienceTitle, experienceSubTitle, date: String
    let time: SenderTime
    let sender: Sender
    let invitationImg, invitationComment: String

    enum CodingKeys: String, CodingKey {
        case reservationID = "reservationId"
        case reservationStatus
        case experienceGiftID = "experienceGiftId"
        case experienceTitle, experienceSubTitle, date, time, sender, invitationImg, invitationComment
    }
}

struct Sender: Codable {
    let id: Int
    let name, birthDay: String
    let age: Int
    let phoneNumber, email, profileImgURL, gender: String

    enum CodingKeys: String, CodingKey {
        case id, name, birthDay, age, phoneNumber, email
        case profileImgURL = "profileImgUrl"
        case gender
    }
}

struct SenderTime: Codable {
    let hour, minute, second, nano: Int
}

extension MyPageSenderEntity {
    static func senderDummy() -> [MyPageSenderEntity] {
        return [
            MyPageSenderEntity(reservationID: 0, reservationStatus: "CANCELLED", experienceGiftID: 0, experienceTitle: "[성수] 인기 베이킹 클래스", experienceSubTitle: "기념일 레터링 케이크 사지 말고 함께 만들어요", date: "2023.07.16", time: SenderTime(hour: 19, minute: 0, second: 0, nano: 0), sender: Sender(id: 0, name: "이승아", birthDay: "", age: 0, phoneNumber: "", email: "", profileImgURL: "", gender: ""), invitationImg: "", invitationComment: ""),
            MyPageSenderEntity(reservationID: 0, reservationStatus: "CONFIRMED", experienceGiftID: 1, experienceTitle: "[삼성] 인기 공예 클래스", experienceSubTitle: "모두가 쉽게 만들 수 있는 꽃 샌드위치박스 클래스", date: "2023.07.16", time: SenderTime(hour: 19, minute: 0, second: 0, nano: 0), sender: Sender(id: 0, name: "이승아", birthDay: "", age: 0, phoneNumber: "", email: "", profileImgURL: "", gender: ""), invitationImg: "", invitationComment: "엄마 생신 축하드려요!!\n예시\n예시\n예시")
        ]
    }
}
