//
//  ExperienceType.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

struct ExperienceType {
    let type: String
}

extension ExperienceType {
    
    static func experienceRecommendMenu() -> [ExperienceType] {
        return [
            ExperienceType(type: "생일"),
            ExperienceType(type: "연인"),
            ExperienceType(type: "부모님"),
            ExperienceType(type: "입학/졸업"),
            ExperienceType(type: "결혼/집들이"),
            ExperienceType(type: "결혼/집들이")
            
        ]
    }
    
    static func experienceCategoryMenu() -> [ExperienceType] {
        return [
            ExperienceType(type: "전체"),
            ExperienceType(type: "공예"),
            ExperienceType(type: "베이킹"),
            ExperienceType(type: "문화예술"),
            ExperienceType(type: "아웃도어"),
            ExperienceType(type: "스포츠"),
            ExperienceType(type: "컨설팅"),
            ExperienceType(type: "기타")
        ]
    }
}
