//
//  GuideDetailView.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/04.
//

import UIKit

import SnapKit

final class GuideDetailView: UIView {
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green

    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
