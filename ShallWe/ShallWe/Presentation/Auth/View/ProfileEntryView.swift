//
//  ProfileEntryView.swift
//  ShallWe
//
//  Created by 김나연 on 12/22/23.
//

import UIKit

import SnapKit

final class ProfileEntryView: UIView {
    
    // MARK: - Properties
    
    private var isCompleted = false
    
    // MARK: - UI Components
    
    private let ageInputLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.ageInputText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private let ageUnitLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.ageUnitText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private let genderSelectionLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.genderSelectionText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private let genderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.nextText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .gray2
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let authHeaderView = AuthHeaderView(frame: .zero, text: I18N.Auth.recommendationText)
    private var ageTextField = CustomTextFieldView()
    private let maleBox = CustomBoxView(frame: .zero, title: I18N.Auth.maleText)
    private let femaleBox = CustomBoxView(frame: .zero, title: I18N.Auth.femaleText)
    private let noneBox = CustomBoxView(frame: .zero, title: I18N.Auth.noneText)
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension ProfileEntryView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(
            authHeaderView,
            ageInputLabel,
            ageTextField,
            ageUnitLabel,
            genderSelectionLabel,
            genderStackView,
            nextButton
        )
        genderStackView.addArrangedSubviews(maleBox, femaleBox, noneBox)
    }
    
    func setLayout() {
        authHeaderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(SizeLiterals.Screen.screenHeight*(64/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        ageInputLabel.snp.makeConstraints {
            $0.top.equalTo(authHeaderView.snp.bottom).offset(SizeLiterals.Screen.screenHeight*(71/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        ageTextField.snp.makeConstraints {
            $0.width.equalTo(128)
            $0.top.equalTo(ageInputLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(24)
        }
        
        ageUnitLabel.snp.makeConstraints {
            $0.leading.equalTo(ageTextField.snp.trailing).offset(6)
            $0.centerY.equalTo(ageTextField.snp.centerY)
        }
        
        genderSelectionLabel.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(SizeLiterals.Screen.screenHeight*(41/768))
            $0.leading.equalToSuperview().inset(24)
        }
        
        genderStackView.snp.makeConstraints {
            $0.top.equalTo(genderSelectionLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(49)
        }
    }
}
