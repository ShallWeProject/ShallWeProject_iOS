//
//  SearchTextFieldView.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import Then
import SnapKit

final class SearchTextFieldView: BaseView {

    // MARK: - UI Components

    let searchTextField = UITextField()
    private let searchIconView = UIImageView()
    lazy var deleteTextButton = UIButton()
    lazy var cancelButton = UIButton()
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.backgroundColor = .bg2
        self.makeCornerRound(radius: 37 / 2)
        
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
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.addSubviews(searchIconView, searchTextField,
                               deleteTextButton, cancelButton)
        
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
    }
}
