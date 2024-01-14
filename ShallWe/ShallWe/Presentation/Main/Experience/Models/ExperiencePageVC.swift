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
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        return menuVCs
    }
    
    static func categoryPageVC() -> [UIViewController] {
        var menuVCs: [UIViewController] = []
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        menuVCs += [ExperienceViewController()]
        return menuVCs
    }
}
