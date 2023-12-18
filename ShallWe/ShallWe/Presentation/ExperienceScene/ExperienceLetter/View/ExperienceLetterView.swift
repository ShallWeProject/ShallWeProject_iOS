//
//  ExperienceLetterView.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/18.
//

import UIKit

import SnapKit

final class ExperienceLetterView: UIView {
    
    // MARK: - UI Components
    
    private let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        navigationBar.isTitleLabelIncluded = true
        navigationBar.titleText = I18N.ExperienceGift.navigationTitle
        return navigationBar
    }()
    
    private let seperatorView1: UIView = {
        let view = UIView()
        view.backgroundColor = .bg1
        return view
    }()
    
    private let senderTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceLetter.senderTitle
        label.font = .fontGuide(.B00_12)
        label.textColor = .black0
        return label
    }()
    
    private let senderTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black0
        textfield.font = .fontGuide(.M00_12)
        textfield.backgroundColor = .gray0
        textfield.layer.borderColor = UIColor.gray2.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.placeholder = I18N.ExperienceLetter.namePlaceholder
        textfield.setPlaceholderColor(.gray4)
        textfield.setLeftPadding(amount: 14)
        return textfield
    }()
    
    private let seperatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = .bg1
        return view
    }()
    
    private let recipientTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceLetter.recipientTitle
        label.font = .fontGuide(.B00_12)
        label.textColor = .black0
        return label
    }()
    
    private let infoIcon: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Icon.alert
        return image
    }()
    
    private let infoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceLetter.infoTitle
        label.font = .fontGuide(.R00_10)
        label.textColor = .gray4
        label.numberOfLines = 0
        return label
    }()
    
    private let recipientNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black0
        textfield.font = .fontGuide(.M00_12)
        textfield.backgroundColor = .gray0
        textfield.layer.borderColor = UIColor.gray2.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.placeholder = I18N.ExperienceLetter.namePlaceholder
        textfield.setPlaceholderColor(.gray4)
        textfield.setLeftPadding(amount: 14)
        return textfield
    }()
    
    private let phoneFirstText: UITextField = {
        let textfield = UITextField()
        textfield.text = I18N.ExperienceLetter.phoneFirstTitle
        textfield.textColor = .black0
        textfield.textAlignment = .center
        textfield.font = .fontGuide(.M00_12)
        textfield.backgroundColor = .bg1
        textfield.layer.borderColor = UIColor.bg4.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.isEnabled = false
        return textfield
    }()
    
    private let phoneMidText: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black0
        textfield.textAlignment = .center
        textfield.font = .fontGuide(.M00_12)
        textfield.backgroundColor = .gray0
        textfield.layer.borderColor = UIColor.gray2.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        return textfield
    }()
    
    private let phoneEndText: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black0
        textfield.textAlignment = .center
        textfield.font = .fontGuide(.M00_12)
        textfield.backgroundColor = .gray0
        textfield.layer.borderColor = UIColor.gray2.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        return textfield
    }()
    
    private let seperatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = .bg1
        return view
    }()
    
    private let inviteTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceLetter.inviteTitle
        label.font = .fontGuide(.B00_12)
        label.textColor = .black0
        return label
    }()
    
    private let letterImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.ExperienceLetter.img_letter
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let letterLabel: UITextField = {
        let textfield = UITextField()
        textfield.text = "예시\n예시\n예시\n예시\n예시"
        textfield.textColor = .black
        textfield.font = .fontGuide(.M00_12)
        textfield.backgroundColor = .clear
        return textfield
    }()
    
    private lazy var giftButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.gift, for: .normal)
        button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 15)
        button.setTitle(I18N.ExperienceDetail.giftButton, for: .normal)
        button.setTitleColor(.bg0, for: .normal)
        button.titleLabel?.font = .fontGuide(.B00_14)
        button.backgroundColor = .point
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

extension ExperienceLetterView {
    func setUI() {
        backgroundColor = .white
        infoIcon.isHidden = true
        infoTitle.isHidden = true
    }
    
    func setHierarchy() {
        addSubviews(navigationBar, seperatorView1, senderTitle, senderTextField, seperatorView2, recipientTitle, recipientNameTextField, infoIcon, infoTitle, phoneFirstText, phoneMidText, phoneEndText, seperatorView3, inviteTitle, letterImage, letterLabel, giftButton)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        seperatorView1.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        senderTitle.snp.makeConstraints {
            $0.top.equalTo(seperatorView1.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        senderTextField.snp.makeConstraints {
            $0.top.equalTo(senderTitle.snp.bottom).offset(10)
            $0.leading.equalTo(senderTitle.snp.leading)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 328 / 375)
            $0.height.equalTo(39)
        }
        
        seperatorView2.snp.makeConstraints {
            $0.top.equalTo(senderTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(4)
        }
        
        recipientTitle.snp.makeConstraints {
            $0.top.equalTo(seperatorView2.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
    
        infoIcon.snp.makeConstraints {
            $0.top.equalTo(recipientTitle.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(15)
            $0.size.equalTo(10)
        }
        
        infoTitle.snp.makeConstraints {
            $0.top.equalTo(recipientTitle.snp.bottom).offset(5)
            $0.leading.equalTo(infoIcon.snp.trailing).offset(5)
        }
        
        recipientNameTextField.snp.makeConstraints {
            $0.top.equalTo(recipientTitle.snp.bottom).offset(10)
            $0.leading.equalTo(recipientTitle.snp.leading)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 328 / 375)
            $0.height.equalTo(39)
        }
        
        phoneFirstText.snp.makeConstraints {
            $0.top.equalTo(recipientNameTextField.snp.bottom).offset(10)
            $0.leading.equalTo(recipientNameTextField.snp.leading)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 103 / 375)
            $0.height.equalTo(39)
        }
        
        phoneMidText.snp.makeConstraints {
            $0.top.equalTo(recipientNameTextField.snp.bottom).offset(10)
            $0.leading.equalTo(phoneFirstText.snp.trailing).offset(10)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 103 / 375)
            $0.height.equalTo(39)
        }
        
        phoneEndText.snp.makeConstraints {
            $0.top.equalTo(recipientNameTextField.snp.bottom).offset(10)
            $0.leading.equalTo(phoneMidText.snp.trailing).offset(10)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 103 / 375)
            $0.height.equalTo(39)
        }
        
        seperatorView3.snp.makeConstraints {
            $0.top.equalTo(phoneEndText.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(4)
        }
        
        inviteTitle.snp.makeConstraints {
            $0.top.equalTo(seperatorView3.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        letterImage.snp.makeConstraints {
            $0.top.equalTo(inviteTitle.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(SizeLiterals.Screen.screenWidth * 20 / 375)
            $0.height.equalTo(212)
        }
        
        letterLabel.snp.makeConstraints {
            $0.top.equalTo(letterImage.snp.top).offset(64)
            $0.horizontalEdges.equalTo(letterImage.snp.horizontalEdges).offset(SizeLiterals.Screen.screenWidth * 37 / 375)
        }
        
        giftButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(UIScreen.main.bounds.width * 335 / 375)
            $0.height.equalTo(43)
        }
    }
}
