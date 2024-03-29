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
        self.viewModel.inputs.presentSortModal()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func bindViewModel() {
        
        viewModel.outputs.sortMenu
            .bind(to: sortListTableView.rx
                .items(cellIdentifier: SortHalfModalCell.className,
                       cellType: SortHalfModalCell.self)) { (index, model, cell) in
                cell.configureCell(model)
            }
            .disposed(by: disposeBag)
        
        sortListTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        sortListTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.dismiss(animated: true)
                if let cell = self.sortListTableView.cellForRow(at: indexPath) as? SortHalfModalCell {
                    if let title = cell.titleLabel.text {
                        self.viewModel.inputs.sortTypeTap(title: title)
                    }
                }
            })
            .disposed(by: disposeBag)
        
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
    
    override func setRegister() {
        sortListTableView.register(SortHalfModalCell.self, forCellReuseIdentifier: SortHalfModalCell.className)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SortHalfModal {
    
    private func dismissToList() {
        self.dismiss(animated: true, completion: nil)
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
