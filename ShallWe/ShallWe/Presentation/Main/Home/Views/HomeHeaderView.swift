//
//  HomeHeaderView.swift
//  ShallWe
//
//  Created by KJ on 12/3/23.
//

import UIKit

enum HomeHeaderType {
    case recommend
    case popular
}

final class HomeHeaderView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let recommendLabel = UILabel()
    private let popularLabel = UILabel()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        
        recommendLabel.do {
            $0.text = I18N.Home.headerTitle1
            $0.textColor = .black0
            $0.partColorChange(targetString: I18N.Home.headerTitle1Color, textColor: .main)
            $0.font = .fontGuide(.B00_14)
            $0.isHidden = true
        }
        
        popularLabel.do {
            $0.text = I18N.Home.headerTitle2
            $0.textColor = .black0
            $0.partColorChange(targetString: I18N.Home.headerTitle2Color, textColor: .main)
            $0.font = .fontGuide(.B00_14)
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.addSubviews(recommendLabel, popularLabel)
        
        recommendLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        popularLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func homeHeaderType(_ type: HomeHeaderType) {
        switch type {
        case .recommend:
            recommendLabel.isHidden = false
        case .popular:
            popularLabel.isHidden = false
        }
    }
}

