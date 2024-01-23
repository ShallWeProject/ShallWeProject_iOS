//
//  MyPageReceiverView.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import UIKit

import SnapKit

final class MyPageReceiverView: UIView {

    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MyPageReceiverView {

    func setUI() {
        backgroundColor = .black
    }
    
    func setHierarchy() {

    }
    
    func setLayout() {

    }
    
    func setAddTarget() {

    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
}
