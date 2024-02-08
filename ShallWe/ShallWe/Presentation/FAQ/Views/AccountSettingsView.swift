//
//  AccountSettingsView.swift
//  ShallWe
//
//  Created by 김나연 on 1/21/24.
//

import UIKit

import SnapKit

final class AccountSettingsView: UIView {
    
    // MARK: - UI Components
    
    private let contentView = UIView()
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        navigationBar.isTitleLabelIncluded = true
        navigationBar.titleText = I18N.FAQ.accountManagementText
        return navigationBar
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.FAQ.logoutText, for: .normal)
        button.setTitleColor(.black0, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .gray0
        button.layer.cornerRadius = 10
        return button
    }()
    
    let withdrawalButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.FAQ.withdrawalText, for: .normal)
        button.setTitleColor(.main, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .bg2
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension AccountSettingsView {
    
    // MARK: - Methods
    
    func setUI() {
        self.backgroundColor = .white
        contentView.backgroundColor = .bg0
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, contentView)
        contentView.addSubviews(logoutButton, withdrawalButton)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.top.equalTo(contentView.snp.top).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        withdrawalButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.top.equalTo(logoutButton.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
    }
}
