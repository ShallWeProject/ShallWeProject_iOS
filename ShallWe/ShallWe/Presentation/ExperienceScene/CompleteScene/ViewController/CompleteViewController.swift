//
//  CompleteViewController.swift
//  ShallWe
//
//  Created by 고아라 on 1/25/24.
//

import UIKit

final class CompleteViewController: UIViewController {
    
    // MARK: - Properties
    
    var fromExperience: Bool = false
    
    // MARK: - UI Components
    
    private let completeView = CompleteView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = completeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAddTarget()
    }
}

// MARK: - Extensions

extension CompleteViewController {

    func setUI() {
        if fromExperience {
            completeView.titleLabel.text = I18N.Complete.fromExperienceTitleLabel
            completeView.subTitleLabel.text = I18N.Complete.fromExperienceSubTitleLabel
        }
    }
    
    func setAddTarget() {
        completeView.homeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        completeView.checkButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        switch sender {
        case completeView.homeButton:
            let nav = TabBarController()
            nav.selectedIndex = 1
            self.navigationController?.pushViewController(nav, animated: true)
        case completeView.checkButton:
            let nav = TabBarController()
            nav.selectedIndex = 2
            self.navigationController?.pushViewController(nav, animated: true)
        default:
            break
        }
    }
}
