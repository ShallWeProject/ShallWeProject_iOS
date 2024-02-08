//
//  TermsDetailsPopUpView.swift
//  ShallWe
//
//  Created by 김나연 on 1/14/24.
//

import UIKit

import SnapKit

final class TermsDetailsPopUpView: UIView {
    
    // MARK: - UI Components
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 28
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        view.layer.cornerRadius = 28
        return view
    }()
    
    let closeButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString(I18N.Auth.closeText, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.SB00_14)]))
        configuration.baseBackgroundColor = .bg4
        configuration.baseForegroundColor = .main
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
        configuration.cornerStyle = .fixed
        configuration.background.cornerRadius = 100
        return UIButton(configuration: configuration)
    }()
    
    // MARK: - View Life Cycle
    
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

private extension TermsDetailsPopUpView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .black.withAlphaComponent(0.3)
    }
    
    func setHierarchy() {
        self.addSubviews(container)
        container.addSubviews(contentView, closeButton)
    }
    
    func setLayout() {
        container.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.centerY.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(SizeLiterals.Screen.screenHeight*(568/812))
            $0.top.equalToSuperview().offset(22)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.bottom).offset(9)
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(24)
        }
    }
}
