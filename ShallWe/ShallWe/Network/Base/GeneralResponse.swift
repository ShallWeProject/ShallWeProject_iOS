//
//  GeneralResponse.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import Foundation

struct GeneralResponse<T: Decodable>: Decodable {
    var data: T?
    var transaction_time: String
    var status: String
    var description: String?
    var statusCode: Int

    enum CodingKeys: String, CodingKey {
        case data
        case transaction_time
        case status
        case description
        case statusCode
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
        transaction_time = (try? values.decode(String.self, forKey: .transaction_time)) ?? ""
        status = (try? values.decode(String.self, forKey: .status)) ?? ""
        statusCode = (try? values.decode(Int.self, forKey: .statusCode)) ?? 0
    }
}
