//
//  MyPageSenderCollectionViewCell.swift
//  ShallWe
//
//  Created by 고아라 on 1/24/24.
//

import UIKit

import SnapKit

protocol MypageDelegate: AnyObject {
    func editButtonTapped()
    func cancelButtonTapped()
}

final class MyPageSenderCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    weak var delegate: MypageDelegate?
    
    // MARK: - UI Components
    
    private let calenderIcon = UIImageView(image: .icCalendar)
    private let timeIcon = UIImageView(image: .icTime)
    
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
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .fontGuide(.M00_12_20)
        label.textColor = .black0
        return label
    }()
    
    private let timeView: UIView = {
        let view = UIView()
        view.makeCornerRound(radius: 15)
        return view
    }()
    
    private let senderLabel: UILabel = {
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
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.foregroundColor: UIColor.line1
        ]
        let attributedTitle = NSAttributedString(string: "예약 변경", attributes: attributes)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.titleLabel?.font = .fontGuide(.M00_12_underlined)
        button.setTitleColor(UIColor.line1, for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.foregroundColor: UIColor.line1
        ]
        let attributedTitle = NSAttributedString(string: "예약 취소", attributes: attributes)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.titleLabel?.font = .fontGuide(.M00_12_underlined)
        button.setTitleColor(UIColor.line1, for: .normal)
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MyPageSenderCollectionViewCell {

    func setUI() {
        self.layer.cornerRadius = 15
    }
    
    func setHierarchy() {
        dateView.addSubviews(calenderIcon, dateLabel)
        timeView.addSubviews(timeIcon, timeLabel)
        letterImage.addSubview(letterLabel)
        self.addSubviews(dateView, timeView, senderLabel, titleLabel, subTitleLabel, letterImage, cancelButton, editButton)
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
        
        timeIcon.snp.makeConstraints {
            $0.size.equalTo(18)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(9)
        }
        
        timeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(11)
        }
        
        timeView.snp.makeConstraints {
            $0.top.equalTo(dateView.snp.top)
            $0.leading.equalTo(dateView.snp.trailing).offset(7)
            $0.width.equalTo(66)
            $0.height.equalTo(27)
        }
        
        senderLabel.snp.makeConstraints {
            $0.top.equalTo(dateView.snp.top)
            $0.leading.equalTo(timeView.snp.trailing).offset(7)
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
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(letterImage.snp.bottom).offset(18)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(45)
            $0.height.equalTo(20)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(cancelButton.snp.top)
            $0.trailing.equalTo(cancelButton.snp.leading).offset(-12)
            $0.width.equalTo(45)
            $0.height.equalTo(20)
        }
    }
    
    func setAddTarget() {
        editButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        switch sender {
        case editButton:
            delegate?.editButtonTapped()
        case cancelButton:
            delegate?.cancelButtonTapped()
        default:
            break
        }
    }
}

extension MyPageSenderCollectionViewCell {
    
    func setDataBind(model: MyPageSenderEntity) {
        dateLabel.text = model.date
        timeLabel.text = "\(model.time.hour)시"
        titleLabel.text = model.experienceTitle
        subTitleLabel.text = model.experienceSubTitle
        switch model.reservationStatus {
        case "CANCELLED":
            self.backgroundColor = .gray0
            senderLabel.isHidden = true
            dateView.backgroundColor = .gray1
            timeView.backgroundColor = .gray1
            letterImage.isHidden = true
            letterLabel.isHidden = true
            editButton.isHidden = true
            cancelButton.isHidden = true
        case "CONFIRMED":
            self.backgroundColor = .bg0
            senderLabel.isHidden = false
            dateView.backgroundColor = .bg4
            timeView.backgroundColor = .bg4
            senderLabel.backgroundColor = .bg4
            senderLabel.text = model.sender.name
            letterImage.isHidden = false
            letterLabel.isHidden = false
            letterLabel.text = model.invitationComment
            letterLabel.setLineSpacing(lineSpacing: 6)
            editButton.isHidden = false
            cancelButton.isHidden = false
        default:
            break
        }
    }
}
