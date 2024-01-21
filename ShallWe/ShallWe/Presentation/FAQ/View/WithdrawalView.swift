//
//  WithdrawalView.swift
//  ShallWe
//
//  Created by 김나연 on 1/21/24.
//

import UIKit

import SnapKit

final class WithdrawalView: UIView {

    // MARK: - UI Components
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        navigationBar.isTitleLabelIncluded = true
        navigationBar.titleText = I18N.FAQ.withdrawalText
        return navigationBar
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cautionLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.cautionText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private let subIntroLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.checkWhatInfoisDeletedText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        label.numberOfLines = 0
        return label
    }()
    
    private let infoDeletedLabel: UILabel = {
        let label = UILabel()
        var strings: [String] = []
        InfoDeleted.allCases.forEach {
            strings.append($0.rawValue)
        }
        label.setBulletPointList(strings: strings)
        label.numberOfLines = 0
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.whatMadeYouUncomfortableText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        label.numberOfLines = 0
        return label
    }()
    
    let withdrawButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.FAQ.withdrawText, for: .normal)
        button.setTitleColor(.bg0, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .gray2
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Initializer
    
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

private extension WithdrawalView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, scrollView)
        scrollView.addSubviews(contentView, withdrawButton)
        contentView.addSubviews(cautionLabel, subIntroLabel, infoDeletedLabel, questionLabel)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        cautionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.leading.equalToSuperview().inset(20)
        }
        
        subIntroLabel.snp.makeConstraints {
            $0.top.equalTo(cautionLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(20)
        }
        
        infoDeletedLabel.snp.makeConstraints {
            $0.top.equalTo(subIntroLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(infoDeletedLabel.snp.bottom).offset(45)
            $0.leading.equalToSuperview().inset(20)
        }
        
        withdrawButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide).inset(20)
            $0.bottom.equalTo(scrollView.frameLayoutGuide).inset(36)
        }
    }
}
