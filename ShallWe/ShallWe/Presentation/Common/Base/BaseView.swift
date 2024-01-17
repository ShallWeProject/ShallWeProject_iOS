//
//  BaseView.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

class BaseView: UIView {

    private lazy var viewName = self.className
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bindViewModel()
        setStyle()
        setLayout()
        setDelegate()
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("🧵 \(viewName) has been successfully Removed")
    }
    
    /// Data 와 UI 를 bind 합니다.
    func bindViewModel() {}
    /// View 의 Style 을 set 합니다.
    func setStyle() {}
    /// View 의 Layout 을 set 합니다.
    func setLayout() {}
    /// View 의 Delegate 을 set 합니다.
    func setDelegate() {}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

