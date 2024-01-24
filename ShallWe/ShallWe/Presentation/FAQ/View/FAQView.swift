//
//  FAQView.swift
//  ShallWe
//
//  Created by 김나연 on 1/18/24.
//

import UIKit

import SnapKit

final class FAQView: UIView {
    
    // MARK: - Properties
    
    private var faqVC: UIViewController? = nil
    
    // MARK: - UI Components
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isFAQViewIncluded = true
        navigationBar.isBackButtonIncluded = true
        return navigationBar
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FAQTableViewCell.self, forCellReuseIdentifier: "FAQTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Initializer
    
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
    
    func configureVC(vc: UIViewController) {
        faqVC = vc
    }
}

// MARK: - Extensions

private extension FAQView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, divider, tableView)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(2)
        }
    }
    
    func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FAQView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FAQ_Description.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell", for: indexPath) as? FAQTableViewCell else { return .init() }
        cell.configure(index: indexPath.row, faqVC: faqVC!)
        return cell
    }
}

extension FAQView: UITableViewDelegate {}