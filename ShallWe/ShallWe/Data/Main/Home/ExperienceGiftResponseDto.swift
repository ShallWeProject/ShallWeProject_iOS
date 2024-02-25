//
//  ExperienceGiftResponseDto.swift
//  ShallWe
//
//  Created by KJ on 2/9/24.
//

import Foundation

struct ExperienceGiftResponseDto: Codable {
    let expCategories: [ExpCategory]
    let sttCategories: [SttCategory]
}

// MARK: - ExpCategory
struct ExpCategory: Codable {
    let expCategoryId: Int
    let expCategory: String
    let imageUrl: String
}

// MARK: - SttCategoryRe
struct SttCategory: Codable {
    let sttCategoryId: Int
    let sttCategory: String
    let imageUrl: String
}


