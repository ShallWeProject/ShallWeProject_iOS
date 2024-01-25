//
//  WithdrawalViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/21/24.
//

import UIKit

final class WithdrawalViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let withdrawalView = WithdrawalView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = withdrawalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setAddTarget()
    }
}

extension WithdrawalViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        withdrawalView.navigationBar.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        withdrawalView.withdrawButton.addTarget(self, action: #selector(withdrawButtonDidTap), for: .touchUpInside)
    }
    
    func showThanksDialog() {
        withdrawalView.createDialogView()
        withdrawalView.setDialogLayout()
        
        UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut, animations: { self.withdrawalView.dialogBarrierView.alpha = 0.0
        }, completion: {(isCompleted) in
            self.withdrawalView.dialogBarrierView.removeFromSuperview()
            self.goToLoginVC()
        })
    }
    
    func goToLoginVC() {
        let loginViewController = LoginViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(loginViewController, animated: false)
    }
    
    // MARK: - Actions
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func withdrawButtonDidTap() {
        showThanksDialog()
    }
}
