//
//  LoginView.swift
//  ShallWe
//
//  Created by 김나연 on 12/10/23.
//

import UIKit

import SnapKit

final class LoginView: UIView {
    
    // MARK: - UI Components
    
    private let shallWeLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Auth.logo_shallWe_big
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
        imageView.image = ImageLiterals.Auth.ic_kakao_login
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let kakaoLoginLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.kakaoLoginText
        label.textColor = .black.withAlphaComponent(0.85)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let appleLoginView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let appleIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "apple.logo")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let appleLoginLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.appleLoginText
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
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

private extension LoginView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .bg0
    }
    
    func setHierarchy() {
        self.addSubview(totalStackView)
        totalStackView.addArrangedSubviews(topStackView, loginStackView)
        topStackView.addArrangedSubviews(shallWeLogoImageView, labelStackView)
        loginStackView.addArrangedSubviews(kakaoLoginView, appleLoginView)
        labelStackView.addArrangedSubviews(mainIntroLabel, subIntroLabel)
        kakaoLoginView.addSubviews(kakaoIconImageView, kakaoLoginLabel)
        appleLoginView.addSubviews(appleIconImageView, appleLoginLabel)
    }
    
    func setLayout() {
        shallWeLogoImageView.snp.makeConstraints {
            $0.height.equalTo(SizeLiterals.Screen.screenHeight*(165.67/768))
        }
        
        kakaoIconImageView.snp.makeConstraints {
            $0.width.equalTo(18)
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
        
        appleIconImageView.snp.makeConstraints {
            $0.width.equalTo(18)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        appleLoginLabel.snp.makeConstraints {
            $0.leading.equalTo(appleIconImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        appleLoginView.snp.makeConstraints {
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
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(38)
        }
    }
}
