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
    private var selectedGenderButton: CustomButton? = nil
    
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
    private let maleButton = CustomButton(frame: .zero, title: I18N.Auth.maleText)
    private let femaleButton = CustomButton(frame: .zero, title: I18N.Auth.femaleText)
    private let noneButton = CustomButton(frame: .zero, title: I18N.Auth.noneText)
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setTag()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension ProfileEntryView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(authHeaderView, ageInputLabel, ageTextField, ageUnitLabel, genderSelectionLabel, genderStackView, nextButton)
        genderStackView.addArrangedSubviews(maleButton, femaleButton, noneButton)
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
    
    func setTag() {
        maleButton.tag = 0
        femaleButton.tag = 1
        noneButton.tag = 2
    }
    
    func setAddTarget() {
        maleButton.addTarget(self, action: #selector(maleButtonDidTap), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(femaleButtonDidTap), for: .touchUpInside)
        noneButton.addTarget(self, action: #selector(noneButtonDidTap), for: .touchUpInside)
    }
    
    func selectGender(tappedButton: CustomButton) {
        if selectedGenderButton == nil {
            selectedGenderButton = tappedButton
            tappedButton.changeToPink()
        } else if tappedButton == selectedGenderButton {
            selectedGenderButton = nil
            tappedButton.changeToGray()
        } else {
            selectedGenderButton!.changeToGray()
            selectedGenderButton = tappedButton
            tappedButton.changeToPink()
        }
    }
    
    // MARK: - Actions
    
    @objc func maleButtonDidTap() {
        selectGender(tappedButton: maleButton)
    }
    
    @objc func femaleButtonDidTap() {
        selectGender(tappedButton: femaleButton)
    }
    
    @objc func noneButtonDidTap() {
        selectGender(tappedButton: noneButton)
    }
}
