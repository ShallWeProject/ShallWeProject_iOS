//
//  ExperiencePageVC.swift
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
        menuVCs += [ExperienceListViewController()]
        menuVCs += [ExperienceListViewController()]
        menuVCs += [ExperienceListViewController()]
        menuVCs += [ExperienceListViewController()]
        menuVCs += [ExperienceListViewController()]
        return menuVCs
    }
}
