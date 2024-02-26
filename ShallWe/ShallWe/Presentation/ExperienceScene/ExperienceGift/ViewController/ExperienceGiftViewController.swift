//
//  ExperienceGiftViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/05.
//

import UIKit

import SnapKit
import FSCalendar

final class ExperienceGiftViewController: UIViewController {
    
    // MARK: - Properties
    
    var fromMypage: Bool = false
    private var currentPage: Date?
    private lazy var today: Date = {
        return Date()
    }()
    private var selectedDate: String = ""
    private var selectedTime: String = ""
    
    private let detailViewModel: ExperienceDetailViewModel
    private let giftViewModel = ExperienceGiftViewModel()
    
    // MARK: - UI Components
    
    private let experienceGiftView = ExperienceGiftView()
    private lazy var timeCollectionView = experienceGiftView.timeCollectionView
    
    private lazy var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateFormat = "yyyy년 M월"
        return df
    }()
    
    // MARK: - Initializer

    init(viewModel: ExperienceDetailViewModel) {
        self.detailViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Life Cycles
    
    override func loadView() {
        
        view = experienceGiftView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDelegate()
        bindViewModel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExperienceGiftViewController {
    
    func setUI() {
        navigationController?.navigationBar.isHidden = true
        experienceGiftView.calendarView.select(today)
        
        if fromMypage {
            experienceGiftView.navigationBar.titleText = I18N.ExperienceGift.fromMypageNavigationTitle
            experienceGiftView.giftButton.setTitle(I18N.ExperienceGift.fromMypageButtonTitle, for: .normal)
            experienceGiftView.giftButton.setImage(nil, for: .normal)
            experienceGiftView.giftPriceLabel.isHidden = true
            experienceGiftView.personTitle.isHidden = true
            experienceGiftView.personButtonStackView.isHidden = true
            experienceGiftView.seperatorView2.isHidden = true
            experienceGiftView.reservationTitle.snp.remakeConstraints {
                $0.top.equalTo(experienceGiftView.seperatorView.snp.bottom).offset(12)
                $0.leading.equalToSuperview().inset(16)
            }
        }
    }
    
    func setDelegate() {
        timeCollectionView.dataSource = self
        timeCollectionView.delegate = self
        experienceGiftView.calendarDelegate = self
        experienceGiftView.calendarView.delegate = self
    }
    
    func bindViewModel() {
        guard let experienceDetail = detailViewModel.experienceDetail else { return }
        self.experienceGiftView.configureGiftView(model: experienceDetail)
        
        giftViewModel.observeExperienceGift { [weak self] experienceGift in
            guard experienceGift != nil else { return }
            self?.experienceGiftView.timeCollectionView.reloadData()
        }
    }
    
    func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
        
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        UIView.animate(withDuration: 0.3, animations: {
            self.experienceGiftView.calendarView.setCurrentPage(self.currentPage!, animated: true)
        })
    }
}

extension ExperienceGiftViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TimeCollectionViewCell {
            cell.timeLabel.backgroundColor = .point
            cell.timeLabel.textColor = .white
            let components = cell.timeLabel.text?.components(separatedBy: CharacterSet.decimalDigits.inverted)
            if let timeHour = components?.first {
                giftViewModel.giftTimeInfo(time: timeHour)
            }
        }
        
        for otherIndexPath in collectionView.indexPathsForVisibleItems where otherIndexPath != indexPath {
            if let otherCell = collectionView.cellForItem(at: otherIndexPath) as? TimeCollectionViewCell {
                otherCell.timeLabel.backgroundColor = .white
                otherCell.timeLabel.textColor = .gray4
            }
        }
    }
}

extension ExperienceGiftViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftViewModel.reservationDate?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TimeCollectionViewCell.dequeueReusableCell(collectionView: timeCollectionView, indexPath: indexPath)
        guard let data = giftViewModel.reservationDate else { return cell }
        cell.configureCell(model: data[indexPath.item])
        return cell
    }
}

extension ExperienceGiftViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 51, height: 28)
    }
}

extension ExperienceGiftViewController: CalendarDelegate {
    func leftButtonTapped() {
        scrollCurrentPage(isPrev: true)
    }
    
    func rightButtonTapped() {
        scrollCurrentPage(isPrev: false)
    }
    
    func giftButtonTapped() {
        if fromMypage {
            self.makeTwoButtonAlert(title: "", message: "\(self.selectedDate) \(self.selectedTime)로\n예약을 변경하시겠습니까?", leftTitle: I18N.ExperienceGift.alertLeftTitle, rightTitle: I18N.ExperienceGift.alertRightTitle, rightAction: {
                let nav = CompleteViewController()
                nav.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(nav, animated: true)
            })
        } else {
            giftViewModel.giftMemberInfo(member: Int(experienceGiftView.personCountLabel.text ?? "") ?? 1)
            let nav = ExperienceLetterViewController(viewModel: self.giftViewModel)
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
}

extension ExperienceGiftViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        if let selectedYear = components.year, let selectedMonth = components.month, let selectedDay = components.day {
            self.selectedDate = "\(selectedYear)-\(String(format: "%02d", selectedMonth))-\(String(format: "%02d", selectedDay))"
            giftViewModel.reservationDate(giftId: 1, date: self.selectedDate)
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        experienceGiftView.monthLabel.text = self.dateFormatter.string(from: calendar.currentPage)
    }
}
