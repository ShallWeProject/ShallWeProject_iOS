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
    }
}

// MARK: - Extensions

extension PhoneNumberVerificationViewController {
    
}
