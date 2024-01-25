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
    
    func setAddTarget() {
        experienceLetterView.giftButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped() {
        let nav = CompleteViewController()
        nav.fromExperience = true
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
