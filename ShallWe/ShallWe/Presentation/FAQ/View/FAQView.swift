//
//  FAQView.swift
//  ShallWe
//
//  Created by 김나연 on 1/18/24.
//

import UIKit

import SnapKit

final class FAQView: UIView {
    
    // MARK: - UI Components
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        return navigationBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension FAQView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .bg2
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, tableView)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(2)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(2)
        }
    }
    
    func setDelegate() {
//        tableView.delegate = self
//        tableView.dataSource = self
    }
}

//extension FAQView: UITableViewDelegate {
//    
//}
//
//extension FAQView: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//}
