//
//  HomeExperiencePageVC.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

struct ExperiencePageVC {
    let vc: [UIViewController]
}

extension ExperiencePageVC {
    
    static func recommendPageVC() -> [UIViewController] {
        var menuVCs: [UIViewController] = []
        menuVCs += [BirthViewController()]
        menuVCs += [BirthViewController()]
        menuVCs += [BirthViewController()]
        menuVCs += [BirthViewController()]
        menuVCs += [BirthViewController()]
        return menuVCs
    }
    
    static func categoryPageVC() -> [UIViewController] {
        var menuVCs: [UIViewController] = []
        menuVCs += [CraftViewController()]
        menuVCs += [BakingViewController()]
        menuVCs += [CultureViewController()]
        menuVCs += [OutdoorViewController()]
        menuVCs += [SportViewController()]
        return menuVCs
    }
}
