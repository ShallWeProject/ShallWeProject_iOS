//
//  TermsPopUpViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/14/24.
//

import UIKit

final class TermsDetailsPopUpViewController: UIViewController {

    // MARK: - UI Components
    
    private let termsDetailsPopUpView = TermsDetailsPopUpView()
    
    // MARK: - Life Cycles
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = termsDetailsPopUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
    }
}

// MARK: - Extensions

private extension TermsDetailsPopUpViewController {
    
    func setAddTarget() {
        termsDetailsPopUpView.closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc func closeButtonDidTap() {
        self.dismiss(animated: false)
    }
}
