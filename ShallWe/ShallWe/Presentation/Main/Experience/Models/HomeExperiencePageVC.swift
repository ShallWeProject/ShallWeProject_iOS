//
//  HomeExperiencePageVC.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

struct HomeExperiencePageVC {
    let vc: [UIViewController]
}

extension HomeExperiencePageVC {
    
    static func recommendPageVC() -> [UIViewController] {
        var menuVCs: [UIViewController] = []
        menuVCs += [BirthViewController()]
        menuVCs += [LoverViewController()]
        menuVCs += [ParentsViewController()]
        menuVCs += [GradeViewController()]
        menuVCs += [MarriageViewController()]
        return menuVCs
    }
    
    static func experiencePageVC() -> [UIViewController] {
        var menuVCs: [UIViewController] = []
        menuVCs += [CraftViewController()]
        menuVCs += [BakingViewController()]
        menuVCs += [CultureViewController()]
        menuVCs += [OutdoorViewController()]
        menuVCs += [SportViewController()]
        return menuVCs
    }
}
