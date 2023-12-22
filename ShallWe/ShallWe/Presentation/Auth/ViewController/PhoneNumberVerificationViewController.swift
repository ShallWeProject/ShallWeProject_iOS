//
//  PhoneNumberVerificationViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/6/23.
//

import UIKit

final class PhoneNumberVerificationViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let phoneNumberVerificationView = PhoneNumberVerificationView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = phoneNumberVerificationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension PhoneNumberVerificationViewController {
    
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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenDidTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: Actions
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func screenDidTap(_ view: UIView) {
        let loginCompletionViewController = LoginCompletionViewController()
        self.navigationController?.pushViewController(loginCompletionViewController, animated: true)
    }
}
