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
    
    // MARK: - Initializer

    init(viewModel: HomeExperienceViewModel) {
        self.viewModel = viewModel
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
            $0.top.equalToSuperview().inset(74-42)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        sortListTableView.delegate = self
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

extension SortHalfModal: UITableViewDelegate {}
