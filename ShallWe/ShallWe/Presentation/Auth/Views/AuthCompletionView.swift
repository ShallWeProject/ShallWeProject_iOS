//
//  AuthCompletionView.swift
//  ShallWe
//
//  Created by 김나연 on 12/16/23.
//

import UIKit

import SnapKit

final class AuthCompletionView: BaseView {
    
    // MARK: - Properties
    
    private var mainText: String
    
    // MARK: - UI Components
    
    private let centerLayoutGuide = UILayoutGuide()
    
    private let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isLogoViewIncluded = true
        return navigationBar
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Auth.img_firework
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .main
        label.font = .fontGuide(.SB00_18)
        label.textAlignment = .center
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.serviceAvailableText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let fullStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = -17
        return stackView
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .point
        button.setTitle(I18N.Auth.goHomeText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - View Life Cycle
    
    init(frame: CGRect, mainText: String) {
        self.mainText = mainText
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    override func setStyle() {
        self.backgroundColor = .white
        mainLabel.text = mainText
    }
    
    override func setLayout() {
        self.addLayoutGuide(centerLayoutGuide)
        self.addSubviews(navigationBar, fullStackView, homeButton)
        fullStackView.addArrangedSubviews(imageView, labelStackView)
        labelStackView.addArrangedSubviews(mainLabel, subLabel)
        
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.height.equalTo(SizeLiterals.Screen.screenHeight*(170/734))
            $0.centerX.equalTo(safeAreaLayoutGuide)
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        
        fullStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(centerLayoutGuide).multipliedBy(1-(65.5/592.0))
        }
        
        centerLayoutGuide.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalTo(navigationBar.snp.horizontalEdges)
            $0.bottom.equalTo(homeButton.snp.top)
        }
        
        homeButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.bottom.equalToSuperview().inset(49)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    override func setAddTarget() {
        homeButton.addTarget(self, action: #selector(homeButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Extensions

extension AuthCompletionView {
    
    // MARK: Actions
    
    @objc private func homeButtonDidTap() {
        let tabBarController = TabBarController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(tabBarController, animated: false)
    }
}
