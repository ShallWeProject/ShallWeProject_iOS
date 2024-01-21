//
//  ExperienceViewController.swift
//  ShallWe
//
//  Created by KJ on 1/14/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class ExperienceViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let experienceView = HomeExperienceListView()
    
    // MARK: - Properties
    
    private let viewModel: HomeExperienceViewModel
    private let disposeBag = DisposeBag()
    private var isDropDownActivated: Bool = false
    var presentSortModal: (() -> Void)?
    
    // MARK: - Initializer

    init(viewModel: HomeExperienceViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func bindViewModel() {
        viewModel.outputs.sortTypeChange
            .subscribe(onNext: { [weak self] indexPath in
                self?.experienceView.indexPath = indexPath
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .clear
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(experienceView)
        
        experienceView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    override func setDelegate() {
        experienceView.sortButtonDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExperienceViewController: SortButtonTapProtocol {
    
    func presentToSortModal() {
        viewModel.inputs.sortButtonTap()
    }
}
