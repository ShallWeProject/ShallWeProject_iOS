//
//  FAQTableViewCell.swift
//  ShallWe
//
//  Created by 김나연 on 1/18/24.
//

import UIKit

import SnapKit

final class FAQTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let qLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.Q
        label.textColor = .point
        label.font = .fontGuide(.faq_20)
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .point
        label.font = .fontGuide(.SB00_12)
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let aLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.A
        label.textColor = .black0
        label.font = .fontGuide(.faq_20)
        return label
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black0
        label.font = .fontGuide(.R00_12)
        label.sizeToFit()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FAQTableViewCell {
    private func setUI() {
        backgroundColor = .white
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(qLabel, questionLabel, aLabel, answerLabel)
        
        qLabel.snp.makeConstraints {
            $0.height.equalTo(28)
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(26)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(qLabel.snp.top).offset(5)
            $0.leading.equalTo(qLabel.snp.trailing).offset(6)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        aLabel.snp.makeConstraints {
            $0.height.equalTo(28)
            $0.top.equalTo(questionLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(26)
        }
        
        answerLabel.snp.makeConstraints {
            $0.top.equalTo(aLabel.snp.top).offset(5)
            $0.leading.equalTo(aLabel.snp.trailing).offset(6)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
    
    // MARK: - Methods
    
    func configure(index: Int, type: FlowType? = nil) {
        // FlowType으로 예약변경/계정설정 부분만 버튼(밑줄) 처리해서 탭하면 VC 이동
        questionLabel.text = FAQ_Description.init(rawValue: index)?.question
        answerLabel.text = FAQ_Description.init(rawValue: index)?.answer
        layoutIfNeeded()
    }
}
