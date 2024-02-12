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
        label.text = I18N.ExperienceDetail.noteTitle
        label.textColor = .black
        label.font = .fontGuide(.B00_12)
        return label
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.text = "· 선물 시 호스트 연락처를 카카오톡으로 보내드립니다.\n· 예약 확정 시 환불이 불가합니다.\n· 예약 시간에 맞추어 늦지 않게 도착해 주시기 바랍니다.\n· 주차는 가능하나, 기계식이라 SUV는 주차가 불가합니다(소울, 레이 동급 차량 불가).\n· 홈클래스로 진행되는 점 참고 부탁드립니다."
        label.textColor = .black
        label.font = .fontGuide(.R00_12)
        label.numberOfLines = 0
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

extension GuideDetailView {
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
