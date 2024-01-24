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
    
    // MARK: - UI Components
    
    private let experienceGiftView = ExperienceGiftView()
    private lazy var collectionView = experienceGiftView.timeCollectionView
    
    private lazy var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateFormat = "yyyy년 M월"
        return df
    }()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = experienceGiftView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDelegate()
    }
}

extension ExperienceGiftViewController {
    func setUI() {
        navigationController?.navigationBar.isHidden = true
        
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
        collectionView.dataSource = self
        collectionView.delegate = self
        experienceGiftView.calendarDelegate = self
        experienceGiftView.calendarView.delegate = self
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
            if let timeText = cell.timeLabel.text {
                self.selectedTime = timeText
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TimeCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
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
            self.makeTwoButtonAlert(title: "", message: "\(self.selectedDate) \(self.selectedTime)로\n예약을 변경하시겠습니까?", leftTitle: "취소", rightTitle: "변경하기", rightAction: {
                let nav = CompleteViewController()
                nav.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(nav, animated: true)
            })
        } else {
            let nav = ExperienceLetterViewController()
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
}

extension ExperienceGiftViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        if let selectedMonth = components.month, let selectedDay = components.day {
            self.selectedDate = "\(selectedMonth)월 \(selectedDay)일"
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        experienceGiftView.monthLabel.text = self.dateFormatter.string(from: calendar.currentPage)
    }
}
