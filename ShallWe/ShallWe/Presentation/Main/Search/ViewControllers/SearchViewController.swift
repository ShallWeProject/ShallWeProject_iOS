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
    private let searchView = UIView()
    private let searchTextField = UITextField()
    private let searchIconView = UIImageView()
    private lazy var deleteTextButton = UIButton()
    private lazy var cancelButton = UIButton()
    private let underLineView = UIView()
    private lazy var resultLabel = UILabel()
    private lazy var searchResultView = SearchResultView()
    
    // MARK: - Properties
    
    private var searchType: SearchType = .clear
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = .white
        
        navigationBar.do {
            $0.isLogoViewIncluded = true
            $0.isBackButtonIncluded = true
        }
        
        searchView.do {
            $0.backgroundColor = .bg2
            $0.makeCornerRound(radius: 37 / 2)
        }
        
        searchIconView.do {
            $0.image = ImageLiterals.Icon.search
        }
        
        searchTextField.do {
            $0.font = .fontGuide(.R00_14)
            $0.textColor = .black
        }
        
        deleteTextButton.do {
            $0.setImage(ImageLiterals.Icon.delete, for: .normal)
            $0.isHidden = true
        }
        
        cancelButton.do {
            $0.setTitle("취소", for: .normal)
            $0.titleLabel?.font = .fontGuide(.R00_14)
            $0.setTitleColor(.line1, for: .normal)
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
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(navigationBar, searchView, underLineView,
                              resultLabel, searchResultView)
        searchView.addSubviews(searchIconView, searchTextField, deleteTextButton, cancelButton)
        
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
        
        searchIconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
        }
        
        searchTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchIconView.snp.trailing).offset(16)
            $0.width.equalTo(147)
            $0.height.equalTo(28)
        }
        
        deleteTextButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(13)
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
            $0.size.equalTo(28)
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
}
