//
//  FAQViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/18/24.
//

import UIKit

final class FAQViewController: UIViewController {

    // MARK: - UI Components
    
    private let faqView = FAQView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        faqView.configureVC(vc: self)
        view = faqView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension FAQViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        faqView.navigationBar.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
