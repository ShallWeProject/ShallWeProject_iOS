//
//  ExperienceDetailResponseDto.swift
//  ShallWe
//
//  Created by 고아라 on 2/9/24.
//

struct ExperienceDetailResponseDto: Codable {
    let giftImgURL: [String]
    let title, subtitle: String
    let price: Int
    let explanation: [Explanation]
    let description, location: String
    let experienceGiftID: Int

    enum CodingKeys: String, CodingKey {
        case giftImgURL = "giftImgUrl"
        case title, subtitle, price, explanation, description, location
        case experienceGiftID = "experienceGiftId"
    }
}

struct Explanation: Codable {
    let stage, description: String
    let explanationURL: String

    enum CodingKeys: String, CodingKey {
        case stage, description
        case explanationURL = "explanationUrl"
    }
}
