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
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
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
    
    private var answerTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black0
        textView.font = .fontGuide(.R00_12)
        textView.isUserInteractionEnabled = true
        textView.isSelectable = true
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = .zero
        return textView
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        return view
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setDelegate()
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
        self.contentView.addSubviews(container, divider)
        container.addSubviews(qLabel, questionLabel, aLabel, answerTextView)
        
        container.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
        
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
        
        answerTextView.snp.makeConstraints {
            $0.top.equalTo(aLabel.snp.top).offset(5)
            $0.leading.equalTo(aLabel.snp.trailing).offset(6)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(15)
        }
        
        divider.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(container.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        answerTextView.delegate = self
    }
    
    // MARK: - Methods
    
    func configure(index: Int) {
        // FlowType으로 예약변경/계정설정 부분만 버튼(밑줄) 처리해서 탭하면 VC 이동
        let description = FAQ_Description.init(rawValue: index)
        questionLabel.text = description!.question
        
        guard let flowType = description?.flowType else {
            answerTextView.text = description!.answer
            layoutIfNeeded()
            return
        }
        setTappableAttributedString(text: description!.answer, flowType: flowType)
        layoutIfNeeded()
    }
    
    private func setTappableAttributedString(text: String, flowType: FlowType) {
        let attributedString = NSMutableAttributedString(string: text, attributes: [.font : UIFont.fontGuide(.R00_12)])
        attributedString.addAttribute(.foregroundColor, value: UIColor.black0, range: NSString(string: text).range(of: text))
        attributedString.addAttribute(.link, value: "", range: NSString(string: text).range(of: flowType.rawValue))
        answerTextView.attributedText = attributedString
        
        let linkAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.main,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        answerTextView.linkTextAttributes = linkAttributes
    }
}

extension FAQTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("🩵")
        return false
    }
}
