//
//  ExperienceCategoryDto.swift
//  ShallWe
//
//  Created by KJ on 2/12/24.
//

import Foundation

// MARK: - 경험별 카테고리
struct ExpCategoryDto: Codable {
    let expCategoryId: Int
    let subtitleTitle: String
    let title: String
    let price: Int
    let giftImgUrl: [String]
    let experienceGiftId: Int
}

// MARK: - 상황별 카테고리
struct SttCategoryDto: Codable {
    let subtitleTitle: String
    let title: String
    let price: Int
    let giftImgUrl: [String]
    let experienceGiftId: Int
}
