//
//  SortHalfModal.swift
//  ShallWe
//
//  Created by KJ on 1/15/24.
//

import UIKit

import Moya
import SnapKit
import Then
import RxCocoa
import RxSwift

final class SortHalfModal: BaseViewController {

    // MARK: - UI Components
    
    private lazy var sortListTableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties
    
    private let viewModel: HomeExperienceViewModel
    private let disposeBag = DisposeBag()
    private let sortModel: [SortModel] = SortModel.sortData()
    private var selectedCellIndex: IndexPath
    
    // MARK: - Initializer

    init(viewModel: HomeExperienceViewModel, index: IndexPath) {
        self.viewModel = viewModel
        self.selectedCellIndex = index
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .bg0
        
        sortListTableView.do {
            $0.rowHeight = 42
            $0.separatorColor = .bg3
            $0.backgroundColor = .clear
            $0.separatorStyle = .singleLine
            $0.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(sortListTableView)
        
        sortListTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        sortListTableView.delegate = self
        sortListTableView.dataSource = self
    }
    
    override func setRegister() {
        sortListTableView.register(SortHalfModalCell.self, forCellReuseIdentifier: SortHalfModalCell.className)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SortHalfModal {
    
    // MARK: - Methods
    
    private func updateSelectedCell(indexPath: IndexPath?) {
        sortListTableView.reloadData()
    }
}

extension SortHalfModal: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeLiterals.Screen.screenHeight * 42 / 812
    }
}

extension SortHalfModal: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SortHalfModalCell.className, for: indexPath) as! SortHalfModalCell
        if indexPath == selectedCellIndex {
            cell.isSelected = true
        }
        cell.configureCell(sortModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.inputs.sortType(indexPath: indexPath)
        self.dismiss(animated: true)
    }
}
