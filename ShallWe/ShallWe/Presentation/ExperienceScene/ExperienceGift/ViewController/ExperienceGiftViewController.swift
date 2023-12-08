//
//  ExperienceGiftViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/05.
//

import UIKit

final class ExperienceGiftViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let experienceGiftView = ExperienceGiftView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = experienceGiftView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
