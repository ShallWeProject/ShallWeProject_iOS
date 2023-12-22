//
//  ProfileEntryViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/22/23.
//

import UIKit

final class ProfileEntryViewController: UIViewController {

    // MARK: - UI Components
    
    private let profileEntryView = ProfileEntryView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = profileEntryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension ProfileEntryViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Icon.arrow_left,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonDidTap))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func setAddTarget() {
        profileEntryView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonDidTap(_ view: UIView) {
        let signUpCompletionViewController = SignUpCompletionViewController()
        self.navigationController?.pushViewController(signUpCompletionViewController, animated: true)
    }
}
