//
//  ExperienceLetterViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/18.
//

import UIKit

final class ExperienceLetterViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let experienceLetterView = ExperienceLetterView()

    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = experienceLetterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
}

extension ExperienceLetterViewController {
    func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
}
