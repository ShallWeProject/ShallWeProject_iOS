//
//  AuthViewController.swift
//  ShallWe
//
//  Created by 김나연 on 12/5/23.
//

import UIKit
import SnapKit
import AuthenticationServices

class AuthViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let shallWeLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Logo.shall_we_logo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mainIntroLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.mainIntroText
        label.textColor = .black1
        label.font = .fontGuide(.SB00_16)
        label.textAlignment = .center
        return label
    }()
    
    private let subIntroLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.subIntroText
        label.textColor = .black2
        label.font = .fontGuide(.M00_12)
        label.textAlignment = .center
        return label
    }()
    
    private let kakaoLoginView: UIView = {
        let view = UIView()
        view.backgroundColor = .kakaoYellow
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let kakaoIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Icon.kakao_login
        return imageView
    }()
    
    private let kakaoLoginLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.kakaoLoginText
        label.textColor = .black.withAlphaComponent(0.85)
        label.font = UIFont.systemFont(ofSize: 14.5)
        label.textAlignment = .center
        return label
    }()
    
//    private let appleLogin
    
    private var labelStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private var loginStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    private var topStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    private var totalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 82
        return stackView
    }()
    
    private var superView = UIView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        setUI()
        setHierarchy()
        setLayout()
        view = superView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions

extension AuthViewController {
    func setUI() {
        superView.backgroundColor = .bg0
    }
    
    func setHierarchy() {
        superView.addSubview(totalStackView)
        totalStackView.addArrangedSubviews(topStackView, loginStackView)
        topStackView.addArrangedSubviews(shallWeLogoImageView, labelStackView)
        loginStackView.addArrangedSubviews(kakaoLoginView)
        labelStackView.addArrangedSubviews(mainIntroLabel, subIntroLabel)
        kakaoLoginView.addSubviews(kakaoIconImageView, kakaoLoginLabel)
    }
    
    func setLayout() {
        shallWeLogoImageView.snp.makeConstraints {
            $0.height.equalTo(SizeLiterals.Screen.screenHeight*(165.67/768))
        }
        
        kakaoIconImageView.snp.makeConstraints {
            $0.width.equalTo(18)
            $0.height.equalTo(18)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        kakaoLoginLabel.snp.makeConstraints {
            $0.leading.equalTo(kakaoIconImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        kakaoLoginView.snp.makeConstraints {
            $0.height.equalTo(45)
            $0.horizontalEdges.equalToSuperview()
        }
        
        loginStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        
        topStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        
        totalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalTo(superView.safeAreaLayoutGuide).inset(38)
        }
    }
}
