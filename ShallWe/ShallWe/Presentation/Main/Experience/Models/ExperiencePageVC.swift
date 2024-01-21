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
    
    static func recommendPageVC(_ viewModel: HomeExperienceViewModel) -> [UIViewController] {
        var menuVCs: [UIViewController] = []
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        return menuVCs
    }
    
    static func categoryPageVC(_ viewModel: HomeExperienceViewModel) -> [UIViewController] {
        var menuVCs: [UIViewController] = []
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        menuVCs += [ExperienceViewController(viewModel: viewModel)]
        return menuVCs
    }
}
