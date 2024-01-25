//
//  CompleteView.swift
//  ShallWe
//
//  Created by 고아라 on 1/25/24.
//

import UIKit

import SnapKit

final class CompleteView: UIView {

    // MARK: - UI Components
    
    private let navigationBar: CustomNavigationBar = {
        let navigation = CustomNavigationBar()
        navigation.isLogoViewIncluded = true
        return navigation
    }()
    
    private let backgroundImage = UIImageView(image: .imgBackground)
    private let letterIcon = UIImageView(image: .icLetter)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Complete.titleLabel
        label.textColor = .main
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Complete.subTitleLabel
        label.textColor = .black0
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .fontGuide(.M00_14)
        return label
    }()
    
    lazy var homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("홈으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .point
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("보낸 선물함 확인하기", for: .normal)
        button.setTitleColor(.point, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .bg2
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension CompleteView {

    func setUI() {
        self.backgroundColor = .white
    }
    
    func setHierarchy() {
        backgroundImage.addSubview(letterIcon)
        self.addSubviews(navigationBar, backgroundImage, titleLabel, subTitleLabel, homeButton, checkButton)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        backgroundImage.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(143)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(239)
            $0.height.equalTo(153)
        }
        
        letterIcon.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(53)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(letterIcon.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 335 / 375)
            $0.height.equalTo(43)
        }
        
        homeButton.snp.makeConstraints {
            $0.bottom.equalTo(checkButton.snp.top).offset(-11)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 335 / 375)
            $0.height.equalTo(43)
        }
    }
}
