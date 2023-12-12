//
//  ExperienceGiftViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/05.
//

import UIKit

import FSCalendar

final class ExperienceGiftViewController: UIViewController {
    
    // MARK: - Properties
    
    private var currentPage: Date?
    
    private lazy var today: Date = {
        return Date()
    }()
    
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
        
        setDelegate()
    }
}

extension ExperienceGiftViewController {
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
            cell.timeLabel.textColor = .bg0
        }
        
        for otherIndexPath in collectionView.indexPathsForVisibleItems where otherIndexPath != indexPath {
            if let otherCell = collectionView.cellForItem(at: otherIndexPath) as? TimeCollectionViewCell {
                otherCell.timeLabel.backgroundColor = .bg0
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
        let nav = ExperienceDetailViewController()
        self.navigationController?.pushViewController(nav, animated: true)
    }
}

extension ExperienceGiftViewController: FSCalendarDelegate {
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        experienceGiftView.monthLabel.text = self.dateFormatter.string(from: calendar.currentPage)
    }
}
