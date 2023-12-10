//
//  BaseViewController.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

class BaseViewController: UIViewController {

    private lazy var viewControllerName = self.className
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setStyle()
        setLayout()
        setDelegate()
        setRegister()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /// Data 와 UI 를 bind 합니다.
    func bindViewModel() {}
    /// View 의 Style 을 set 합니다.
    func setStyle() {}
    /// View 의 Layout 을 set 합니다.
    func setLayout() {}
    /// View 의 Delegate 을 set 합니다.
    func setDelegate() {}
    /// View 의 Register 를 set 합니다.
    func setRegister() {}
    
    deinit {
        print("🧶 \(viewControllerName) is deinited")
    }
}
