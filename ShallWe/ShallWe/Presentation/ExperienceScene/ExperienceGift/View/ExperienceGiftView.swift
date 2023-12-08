//
//  ExperienceGiftView.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/05.
//

import UIKit

import SnapKit
import FSCalendar

final class ExperienceGiftView: UIView {
    
    // MARK: - UI Components
    
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
    
    private let experienceTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceGift.experienceGiftTitle
        label.font = .fontGuide(.B00_14)
        label.textColor = .black
        return label
    }()
    
    private let giftImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "example")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var giftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    private let giftTitle: UILabel = {
        let label = UILabel()
        label.text = "[성수] 인기베이킹 클래스"
        label.textColor = .black0
        label.font = .fontGuide(.B00_12)
        return label
    }()
    
    private let giftSubTitle: UILabel = {
        let label = UILabel()
        label.text = "기념일 레터링 케이크\n사지 말고 함께 만들어요"
        label.textColor = .black
        label.font = .fontGuide(.M00_14)
        label.setLineSpacing(lineSpacing: 2.3)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let giftPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "75,000원"
        label.textColor = .main
        label.font = .fontGuide(.B00_14)
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        return view
    }()
    
    private let personTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceGift.personTitle
        label.font = .fontGuide(.B00_14)
        label.textColor = .black
        return label
    }()
    
    private lazy var personButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        return stackView
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.minus, for: .normal)
        button.backgroundColor = .bg4
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.plus, for: .normal)
        button.backgroundColor = .point_50
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var personCountLabel: UILabel = {
        let label = UILabel()
        label.text = "222"
        label.textAlignment = .center
        label.font = .fontGuide(.SB00_14)
        return label
    }()
    
    private let seperatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        return view
    }()
    
    private let reservationTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceGift.reservationTitle
        label.font = .fontGuide(.B00_14)
        label.textColor = .black
        return label
    }()
    
    private var calendarView: FSCalendar = {
        let calendar = FSCalendar(frame: .zero)
        calendar.scope = .month
        calendar.layer.cornerRadius = 10
        calendar.backgroundColor = .bg3
        return calendar
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setCalenderUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExperienceGiftView {
    func setUI() {
        backgroundColor = .bg0
    }
    
    func setCalenderUI() {
        self.calendarView.locale = Locale(identifier: "ko_KR")
        
        self.calendarView.appearance.weekdayFont = .systemFont(ofSize: 14, weight: .semibold)
        self.calendarView.appearance.weekdayTextColor = .black_50
        self.calendarView.weekdayHeight = 40
        self.calendarView.appearance.titleFont = .systemFont(ofSize: 16, weight: .medium)
        self.calendarView.appearance.titleDefaultColor = .gray4
        self.calendarView.appearance.titlePlaceholderColor = .gray2
        self.calendarView.appearance.headerDateFormat = "YYYY년 MM월"
        self.calendarView.appearance.headerTitleFont = .fontGuide(.SB00_16)
        self.calendarView.appearance.headerTitleColor = .black0
        self.calendarView.appearance.headerTitleAlignment = .center
        self.calendarView.appearance.selectionColor = .point
        self.calendarView.appearance.todayColor = .clear
        self.calendarView.appearance.titleTodayColor = .gray4
        self.calendarView.appearance.todaySelectionColor = .point
        self.calendarView.appearance.borderRadius = 0.5
    }
    
    func setHierarchy() {
        giftStackView.addArrangedSubviews(giftTitle, giftSubTitle, giftPriceLabel)
        personButtonStackView.addArrangedSubviews(minusButton, personCountLabel, plusButton)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(experienceTitle, giftImage, giftStackView, seperatorView, personTitle, personButtonStackView, seperatorView2, reservationTitle, calendarView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(self.snp.height).priority(.low)
        }
        
        experienceTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        giftImage.snp.makeConstraints {
            $0.top.equalTo(experienceTitle.snp.bottom).offset(6)
            $0.leading.equalTo(experienceTitle.snp.leading)
            $0.width.equalTo(145)
            $0.height.equalTo(101)
        }
        
        giftStackView.snp.makeConstraints {
            $0.top.equalTo(giftImage.snp.top).offset(2)
            $0.leading.equalTo(giftImage.snp.trailing).offset(35)
            $0.width.equalTo(147)
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(giftImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        personTitle.snp.makeConstraints {
            $0.top.equalTo(seperatorView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        minusButton.snp.makeConstraints {
            $0.size.equalTo(27)
        }
        
        plusButton.snp.makeConstraints {
            $0.size.equalTo(27)
        }
        
        personButtonStackView.snp.makeConstraints {
            $0.top.equalTo(personTitle.snp.bottom).offset(9)
            $0.leading.equalTo(personTitle.snp.leading)
            $0.height.equalTo(27)
        }
        
        seperatorView2.snp.makeConstraints {
            $0.top.equalTo(personButtonStackView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        reservationTitle.snp.makeConstraints {
            $0.top.equalTo(seperatorView2.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        calendarView.snp.makeConstraints {
            $0.top.equalTo(reservationTitle.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(34)
            $0.height.equalTo(386)
        }
    }
}
