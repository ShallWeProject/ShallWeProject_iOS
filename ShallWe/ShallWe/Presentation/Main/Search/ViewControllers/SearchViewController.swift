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
import RxGesture

enum SearchType {
    case clear
    case recent
}

var searchTypeRelay = BehaviorRelay<SearchType>(value: .clear)
var recentSearchModel: [RecentSearchModel] = []

final class SearchViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let searchView = SearchTextFieldView()
    private let underLineView = UIView()
    private lazy var clearLabel = UILabel()
    private lazy var noResultLabel = UILabel()
    private lazy var searchResultView = SearchResultView()
    private lazy var recentSearchView = RecentSearchView()
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private let tapGesture = UITapGestureRecognizer()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.searchView.searchTextField.becomeFirstResponder()
        self.setSearchLabel(searchTypeRelay.value)
    }
    
    override func bindViewModel() {
        navigationBar.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.popToHomeVC()
                self?.view.endEditing(true)
            })
            .disposed(by: disposeBag)
        
        searchView.cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.popToHomeVC()
                self?.view.endEditing(true)
            })
            .disposed(by: disposeBag)
        
        self.view.rx.tapGesture()
            .when(.recognized)
            .observe(on: MainScheduler.instance)
            .bind { [weak self] gesture in
                self?.didTapScreen(gesture)
            }
            .disposed(by: disposeBag)
        
        recentSearchView.deleteAllButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                recentSearchModel.removeAll()
                recentSearchView.recentCollectionView.reloadData()
                searchTypeRelay.accept(.clear)
            })
            .disposed(by: disposeBag)
        
        searchTypeRelay
            .asObservable()
            .subscribe(onNext: { [weak self] newSearchType in
                self?.setSearchLabel(newSearchType)
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
        
        clearLabel.do {
            $0.font = .fontGuide(.SB00_14)
            $0.textColor = .gray4
        }
        
        noResultLabel.do {
            $0.font = .fontGuide(.SB00_14)
            $0.textColor = .gray4
            $0.isHidden = true
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
                              noResultLabel, clearLabel, searchResultView,
                              recentSearchView)
        
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
        
        clearLabel.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(109)
            $0.centerX.equalToSuperview()
        }
        
        noResultLabel.snp.makeConstraints {
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
    
    // MARK: - Methods
    
    override func setDelegate() {
        searchView.searchTextField.delegate = self
    }
}

extension SearchViewController {
    
    // MARK: - Methods
    
    private func setSearchLabel(_ newSearchType: SearchType) {
        switch newSearchType {
        case .clear:
            clearLabel.text = "최근 검색어 내역이 없습니다."
            recentSearchView.isHidden = true
            clearLabel.isHidden = false
        case .recent:
            recentSearchView.isHidden = false
            clearLabel.isHidden = true
        }
        recentSearchView.recentCollectionView.reloadData()
    }
    
    private func popToHomeVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func didTapScreen(_ gesture: UITapGestureRecognizer) {
        DispatchQueue.main.async { [weak self] in
            let touchLocation = gesture.location(in: self?.view)
            if ((self?.searchView.frame.contains(touchLocation)) == nil) {
                self?.view.endEditing(true)
            }
        }
    }
    
    private func setSearch() {
        clearLabel.isHidden = true
        recentSearchView.isHidden = true
    }
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            recentSearchModel.append(RecentSearchModel(title: text))
            searchTypeRelay.accept(.recent)
            textField.text = ""
            setSearch()
            // 서버통신 기능 추가
            if text == "nn" {
                noResultLabel.isHidden = false
                noResultLabel.text = "\"\(text)\"에 대한 검색결과가 없습니다."
                searchResultView.isHidden = true
            } else {
                searchResultView.isHidden = false
                noResultLabel.isHidden = true
            }
        }
        return true
    }
}
