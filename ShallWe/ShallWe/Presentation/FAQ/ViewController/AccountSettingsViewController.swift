//
//  AccountSettingsViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/21/24.
//

import UIKit

final class AccountSettingsViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let accountSettingsView = AccountSettingsView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = accountSettingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension AccountSettingsViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        accountSettingsView.navigationBar.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        accountSettingsView.logoutButton.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
        accountSettingsView.withdrawalButton.addTarget(self, action: #selector(withdrawalButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc 
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    } 
    
    @objc 
    func logoutButtonDidTap() {
        // TODO: 로그아웃 alert 띄우기
    }
    
    @objc
    func withdrawalButtonDidTap() {
        // TODO: 회원 탈퇴 화면으로 이동
    }
}

