//
//  HomeExperienceType.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

struct HomeExperienceType {
    let type: String
}

extension HomeExperienceType {
    
    static func recommendMenu() -> [HomeExperienceType] {
        return [
            HomeExperienceType(type: "생일"),
            HomeExperienceType(type: "연인"),
            HomeExperienceType(type: "부모님"),
            HomeExperienceType(type: "입학/졸업"),
            HomeExperienceType(type: "결혼/집들이")
            
        ]
    }
    
    static func categoryMenu() -> [HomeExperienceType] {
        return [
            HomeExperienceType(type: "전체"),
            HomeExperienceType(type: "공예"),
            HomeExperienceType(type: "베이킹"),
            HomeExperienceType(type: "문화예술"),
            HomeExperienceType(type: "아웃도어"),
            HomeExperienceType(type: "스포츠"),
            HomeExperienceType(type: "컨설팅"),
            HomeExperienceType(type: "기타")
        ]
    }
}
