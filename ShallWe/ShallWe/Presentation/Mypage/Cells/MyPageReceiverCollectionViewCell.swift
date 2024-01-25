//
//  MyPageReceiverCollectionViewCell.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import UIKit

import SnapKit

final class MyPageReceiverCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - UI Components
    
    private let calenderIcon = UIImageView(image: .icCalendar)
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .fontGuide(.M00_12_20)
        label.textColor = .black0
        return label
    }()
    
    private let dateView: UIView = {
        let view = UIView()
        view.makeCornerRound(radius: 15)
        return view
    }()
    
    private let receiverLabel: UILabel = {
        let label = UILabel()
        label.font = .fontGuide(.M00_12_20)
        label.textColor = .black0
        label.textAlignment = .center
        label.makeCornerRound(radius: 15)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontGuide(.SB00_12)
        label.textColor = .black0
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontGuide(.SB00_14)
        label.textColor = .black0
        return label
    }()
    
    private let letterImage = UIImageView(image: ImageLiterals.ExperienceLetter.img_letter)
    
    private let letterLabel: UILabel = {
        let label = UILabel()
        label.font = .fontGuide(.M00_12_20)
        label.textColor = .black0
        label.textAlignment = .left
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension MyPageReceiverCollectionViewCell {

    func setUI() {
        self.layer.cornerRadius = 15
    }
    
    func setHierarchy() {
        dateView.addSubviews(calenderIcon, dateLabel)
        letterImage.addSubview(letterLabel)
        self.addSubviews(dateView, receiverLabel, titleLabel, subTitleLabel, letterImage)
    }
    
    func setLayout() {
        calenderIcon.snp.makeConstraints {
            $0.size.equalTo(18)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(9)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(11)
        }
        
        dateView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(17)
            $0.width.equalTo(101)
            $0.height.equalTo(27)
        }
        
        receiverLabel.snp.makeConstraints {
            $0.top.equalTo(dateView.snp.top)
            $0.leading.equalTo(dateView.snp.trailing).offset(7)
            $0.width.equalTo(52)
            $0.height.equalTo(27)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateView.snp.bottom).offset(14)
            $0.leading.equalTo(dateView.snp.leading)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        letterImage.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(322)
            $0.height.equalTo(209)
        }
        
        letterLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(82)
            $0.width.equalTo(260)
        }
    }
}

extension MyPageReceiverCollectionViewCell {
    
    func setDataBind(model: MyPageReceiverEntity) {
        dateLabel.text = model.date
        titleLabel.text = model.experienceTitle
        subTitleLabel.text = model.experienceSubTitle
        switch model.reservationStatus {
        case "CANCELLED":
            self.backgroundColor = .gray0
            receiverLabel.isHidden = true
            dateView.backgroundColor = .gray1
            letterImage.isHidden = true
            letterLabel.isHidden = true
        case "CONFIRMED":
            self.backgroundColor = .bg0
            receiverLabel.isHidden = false
            dateView.backgroundColor = .bg4
            receiverLabel.backgroundColor = .bg4
            receiverLabel.text = model.receiver.name
            letterImage.isHidden = false
            letterLabel.isHidden = false
            letterLabel.text = model.invitationComment
            letterLabel.setLineSpacing(lineSpacing: 6)
        default:
            break
        }
    }
}
