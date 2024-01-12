//
//  AgreementToTermsViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/12/24.
//

import UIKit

final class AgreementToTermsViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let agreementOfTermsView = AgreementOfTermsView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = agreementOfTermsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension AgreementToTermsViewController {
    
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
        agreementOfTermsView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonDidTap() {
        let profileEntryViewController = ProfileEntryViewController()
        self.navigationController?.pushViewController(profileEntryViewController, animated: true)
    }
}
