//
//  MyPageReceiverEntity.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import Foundation

struct MyPageReceiverEntity: Codable {
    let reservationID: Int
    let reservationStatus, experienceTitle, experienceSubTitle, date: String
    let time: ReceiverTime
    let receiver: Receiver
    let invitationImg, invitationComment: String

    enum CodingKeys: String, CodingKey {
        case reservationID = "reservationId"
        case reservationStatus, experienceTitle, experienceSubTitle, date, time, receiver, invitationImg, invitationComment
    }
}

struct Receiver: Codable {
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

struct ReceiverTime: Codable {
    let hour, minute, second, nano: Int
}

extension MyPageReceiverEntity {
    static func receiveDummy() -> [MyPageReceiverEntity] {
        return [
            MyPageReceiverEntity(reservationID: 0, reservationStatus: "CANCELLED", experienceTitle: "[성수] 인기 베이킹 클래스", experienceSubTitle: "기념일 레터링 케이크 사지 말고 함께 만들어요", date: "2023.07.16", time: ReceiverTime(hour: 19, minute: 0, second: 0, nano: 0), receiver: Receiver(id: 0, name: "박은영", birthDay: "", age: 0, phoneNumber: "", email: "", profileImgURL: "", gender: ""), invitationImg: "", invitationComment: ""),
            MyPageReceiverEntity(reservationID: 0, reservationStatus: "CONFIRMED", experienceTitle: "[삼성] 인기 공예 클래스", experienceSubTitle: "모두가 쉽게 만들 수 있는 꽃 샌드위치박스 클래스", date: "2023.07.16", time: ReceiverTime(hour: 19, minute: 0, second: 0, nano: 0), receiver: Receiver(id: 0, name: "박은영", birthDay: "", age: 0, phoneNumber: "", email: "", profileImgURL: "", gender: ""), invitationImg: "", invitationComment: "엄마 생신 축하드려요!!\n예시\n예시\n예시")
        ]
    }
}
