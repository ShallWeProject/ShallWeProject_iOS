//
//  SearchViewController.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

enum SearchType {
    case results
    case clear
    case recent
    case NoResults
}

final class SearchViewController: BaseViewController {

    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let searchView = SearchTextFieldView()
    private let underLineView = UIView()
    private lazy var resultLabel = UILabel()
    private lazy var searchResultView = SearchResultView()
    private lazy var recentSearchView = RecentSearchView()
    
    // MARK: - Properties
    
    private var searchType: SearchType = .clear
    private let disposeBag = DisposeBag()
    private var recentSearchModel: [RecentSearchModel] = []
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func bindViewModel() {
        navigationBar.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.popToHomeVC()
            })
            .disposed(by: disposeBag)
        
        searchView.cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.popToHomeVC()
            })
            .disposed(by: disposeBag)
        
        
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .white
        
        navigationBar.do {
            $0.isLogoViewIncluded = true
            $0.isBackButtonIncluded = true
        }
        
        underLineView.do {
            $0.backgroundColor = .bg2
        }
        
        resultLabel.do {
            $0.font = .fontGuide(.SB00_14)
            $0.textColor = .gray4
        }
        
        searchResultView.do {
            $0.isHidden = true
        }
        
        recentSearchView.do {
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(navigationBar, searchView, underLineView,
                              resultLabel, searchResultView, recentSearchView)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        searchView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(37)
        }
    
        underLineView.snp.makeConstraints {
            $0.top.equalTo(searchView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(1)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(109)
            $0.centerX.equalToSuperview()
        }
        
        searchResultView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        recentSearchView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(12)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

extension SearchViewController {
    
    // MARK: - Methods
    
    private func setSearchLabel() {
        switch searchType {
        case .clear:
            resultLabel.text = "최근 검색어 내역이 없습니다."
        case .NoResults:
            resultLabel.text = "에 대한 검색결과가 없습니다."
        default:
            return
        }
    }
    
    private func popToHomeVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func didTapScreen(_ gesture: UITapGestureRecognizer) {
        
    }
}
