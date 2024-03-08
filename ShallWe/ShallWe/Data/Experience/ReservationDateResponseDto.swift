//
//  ReservationDateResponseDto.swift
//  ShallWe
//
//  Created by 고아라 on 2/15/24.
//

import Foundation

struct ReservationDateResponseDto: Codable {
    let reservationID: Int
    let status, time: String

    enum CodingKeys: String, CodingKey {
        case reservationID = "reservationId"
        case status, time
    }
}
