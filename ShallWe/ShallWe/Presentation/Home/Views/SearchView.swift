//
//  SearchView.swift
//  ShallWe
//
//  Created by KJ on 12/2/23.
//

import UIKit

import Then
import SnapKit

final class SearchView: BaseView {

    // MARK: - UI Components
    
    private let searchImageView = UIImageView()
    private let textLabel = UILabel()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        self.backgroundColor = .bg2
        self.makeCornerRound(radius: 37 / 2)
        
        searchImageView.do {
            $0.image = ImageLiterals.Icon.search
        }
        
        textLabel.do {
            $0.text = "찾고있는 경험이 있나요?"
            $0.font = .fontGuide(.R00_14)
            $0.textColor = .line1
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        self.addSubviews(searchImageView, textLabel)
        
        searchImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
        }
        
        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchImageView.snp.trailing).offset(17)
        }
    }
}
