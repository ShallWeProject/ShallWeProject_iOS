//
//  GuideDetailView.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/04.
//

import UIKit

import SnapKit

final class GuideDetailView: UIView {
    
    // MARK: - UI Components
    
    private let noteTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .fontGuide(.B00_12)
        return label
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .fontGuide(.R00_12)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let changeTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceDetail.changeTitle
        label.textColor = .gray4
        label.font = .fontGuide(.B00_12)
        return label
    }()
    
    private let changeLabel: UILabel = {
        let label = UILabel()
        label.text = "예약 변경은 이용일로부터 3일 전까지만 가능합니다. 마이페이지 > 보낸선물함에서 ‘예약 변경’을 클릭하여 원하는 일시로 예약을 변경해주세요."
        label.textColor = .gray4
        label.font = .fontGuide(.R00_12)
        label.numberOfLines = 0
        return label
    }()
    
    private let cancelTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceDetail.cancelTitle
        label.textColor = .gray4
        label.font = .fontGuide(.B00_12)
        return label
    }()
    
    private let cancelLabel: UILabel = {
        let label = UILabel()
        label.text = "예약 취소는 이용일로부터 7일 전까지만 가능합니다. 이후 예약을 취소하실 경우, 작가님께 개인적으로 연락해주세요. 취소 일시에 따라 별도의 수수료가 부과될 수 있는 점 참고 부탁드립니다."
        label.textColor = .gray4
        label.font = .fontGuide(.R00_12)
        label.numberOfLines = 0
        return label
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

private extension GuideDetailView {
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        addSubviews(noteTitle, noteLabel, changeTitle, changeLabel, cancelTitle, cancelLabel)
    }
    
    func setLayout() {
        noteTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview().inset(16)
        }
        
        noteLabel.snp.makeConstraints {
            $0.top.equalTo(noteTitle.snp.bottom).offset(18)
            $0.leading.equalTo(noteTitle.snp.leading)
            $0.width.equalTo(343)
        }
        
        changeTitle.snp.makeConstraints {
            $0.top.equalTo(noteLabel.snp.bottom).offset(40)
            $0.leading.equalTo(noteLabel.snp.leading)
        }
        
        changeLabel.snp.makeConstraints {
            $0.top.equalTo(changeTitle.snp.bottom).offset(11)
            $0.leading.equalTo(changeTitle.snp.leading)
            $0.width.equalTo(343)
        }
        
        cancelTitle.snp.makeConstraints {
            $0.top.equalTo(changeLabel.snp.bottom).offset(34)
            $0.leading.equalTo(changeLabel.snp.leading)
        }
        
        cancelLabel.snp.makeConstraints {
            $0.top.equalTo(cancelTitle.snp.bottom).offset(21)
            $0.leading.equalTo(cancelTitle.snp.leading)
            $0.width.equalTo(343)
        }
    }
}

extension GuideDetailView {
    
    func configureGuideView(model: ExperienceDetailResponseDto) {
        let noteList = model.note.split(separator: "\n")
        var noteListLabel = ""
        for i in 1..<noteList.count {
            noteListLabel.append(noteList[i].description + "\n")
        }
        noteTitle.text = noteList[0].description
        noteLabel.text = noteListLabel
    }
}
