//
//  MyPageViewController.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import UIKit

final class MyPageViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let myPageView = MyPageView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions

extension MyPageViewController {

    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        
    }
}

// MARK: - Network

extension MyPageViewController {

    func getAPI() {
        
    }
}
