//
//  ExperienceGiftResponseDto.swift
//  ShallWe
//
//  Created by KJ on 2/9/24.
//

import Foundation

struct ExperienceGiftResponseDto: Codable {
    let expCategories: [ExpCategory]
    let sttCategoryRes: [SttCategoryRe]
}

// MARK: - ExpCategory
struct ExpCategory: Codable {
    let expCategoryId: Int
    let expCategory: String
    let imageUrl: String
}

// MARK: - SttCategoryRe
struct SttCategoryRe: Codable {
    let sttCategoryId: Int
    let sttCategory: String
    let imageUrl: String
}


