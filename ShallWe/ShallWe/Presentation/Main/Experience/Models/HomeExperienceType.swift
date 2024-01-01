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
            HomeExperienceType(type: I18N.HomeExperience.birth),
            HomeExperienceType(type: I18N.HomeExperience.lover),
            HomeExperienceType(type: I18N.HomeExperience.parents),
            HomeExperienceType(type: I18N.HomeExperience.graduate),
            HomeExperienceType(type: I18N.HomeExperience.marriage)
            
        ]
    }
    
    static func categoryMenu() -> [HomeExperienceType] {
        return [
            HomeExperienceType(type: I18N.HomeExperience.all),
            HomeExperienceType(type: I18N.HomeExperience.craft),
            HomeExperienceType(type: I18N.HomeExperience.baking),
            HomeExperienceType(type: I18N.HomeExperience.culture),
            HomeExperienceType(type: I18N.HomeExperience.outdoor),
            HomeExperienceType(type: I18N.HomeExperience.sport),
            HomeExperienceType(type: I18N.HomeExperience.consulting),
            HomeExperienceType(type: I18N.HomeExperience.other)
        ]
    }
}
