//
//  FAQViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/18/24.
//

import UIKit

final class FAQViewController: UIViewController {

    // MARK: - UI Components
    
    private let faqView = FAQView()
    private lazy var tableView = faqView.tableView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = faqView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setAddTarget()
        setDelegate()
    }
}

// MARK: - Extensions

extension FAQViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        faqView.navigationBar.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Actions
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FAQViewController: FAQDelegate {
    func changeReservationTextDidTap() {
        // TODO: 예약변경 VC로 이동
    }
    
    func accountSettingsTextDidTap() {
        let accountSettingsViewController = AccountSettingsViewController()
        self.navigationController?.pushViewController(accountSettingsViewController, animated: true)
    }
}

extension FAQViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FAQ_Description.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell", for: indexPath) as? FAQTableViewCell else { return .init() }
        cell.configure(index: indexPath.row)
        cell.delegate = self
        return cell
    }
}

extension FAQViewController: UITableViewDelegate {}
