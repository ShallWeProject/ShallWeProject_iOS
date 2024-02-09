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
    let expCategoryID: Int
    let expCategory: String
    let imageURL: String
}

// MARK: - SttCategoryRe
struct SttCategoryRe: Codable {
    let sttCategoryID: Int
    let sttCategory: String
    let imageURL: String
}
