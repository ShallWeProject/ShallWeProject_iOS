//
//  CategoryView.swift
//  ShallWe
//
//  Created by KJ on 1/1/24.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

final class CategoryViewController: BaseViewController {

    // MARK: - UI Components
    
    private let categoryView = UIView()
    private let logoView = UIImageView()
    
    private let experienceLabel = UILabel()
    private let craftButton = UIButton()
    private let bakingButton = UIButton()
    private let cultureButton = UIButton()
    private let outdoorButton = UIButton()
    private let sportButton = UIButton()
    
    private let myPageLabel = UILabel()
    private let albumButton = UIButton()
    private let sendGiftButton = UIButton()
    private let getGiftButton = UIButton()
    
    private let customerServiceLabel = UILabel()
    private let faqButton = UIButton()
    private let mailButton = UIButton()
    private let experienceVC = CategoryListViewController(index: IndexPath(item: 0, section: 0))
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        setStyle()
        setLayout()
        bindViewModel()
        setTapScreen()
    }
    
    override func bindViewModel() {
        
        craftButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.pushToCategoryListVC(index: IndexPath(item: 0, section: 0))
            })
            .disposed(by: disposeBag)
        
        bakingButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.pushToCategoryListVC(index: IndexPath(item: 0, section: 1))
            })
            .disposed(by: disposeBag)
        
        cultureButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.pushToCategoryListVC(index: IndexPath(item: 0, section: 2))
            })
            .disposed(by: disposeBag)
        
        outdoorButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.pushToCategoryListVC(index: IndexPath(item: 0, section: 3))
            })
            .disposed(by: disposeBag)
        
        sportButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.pushToCategoryListVC(index: IndexPath(item: 0, section: 4))
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - UI Components Property
    
    override func setStyle() {
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
 
        categoryView.do {
            $0.backgroundColor = .bg3
            $0.makeCornerRound(radius: 25)
        }
        
        logoView.do {
            $0.image = ImageLiterals.Home.logo_shallwe
        }
        
        experienceLabel.do {
            $0.text = I18N.Category.experienceCategory
            $0.font = .fontGuide(.B00_12)
            $0.textColor = .black0
        }
        
        myPageLabel.do {
            $0.text = I18N.Category.myPage
            $0.font = .fontGuide(.B00_12)
            $0.textColor = .black0
        }
        
        customerServiceLabel.do {
            $0.text = I18N.Category.customerService
            $0.font = .fontGuide(.B00_12)
            $0.textColor = .black0
        }
        
        craftButton.do {
            $0.setImage(ImageLiterals.Category.ic_craft, for: .normal)
        }
        
        bakingButton.do {
            $0.setImage(ImageLiterals.Category.ic_baking, for: .normal)
        }
        
        cultureButton.do {
            $0.setImage(ImageLiterals.Category.ic_culture, for: .normal)
        }
        
        outdoorButton.do {
            $0.setImage(ImageLiterals.Category.ic_outdoor, for: .normal)
        }
        
        sportButton.do {
            $0.setImage(ImageLiterals.Category.ic_sport, for: .normal)
        }
        
        albumButton.do {
            $0.setImage(ImageLiterals.Category.ic_album, for: .normal)
        }
        
        sendGiftButton.do {
            $0.setImage(ImageLiterals.Category.ic_sendGift, for: .normal)
        }
        
        getGiftButton.do {
            $0.setImage(ImageLiterals.Category.ic_getGift, for: .normal)
        }
        
        faqButton.do {
            $0.setImage(ImageLiterals.Category.ic_faq, for: .normal)
        }
        
        mailButton.do {
            $0.setImage(ImageLiterals.Category.ic_mail, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        
        self.view.addSubviews(categoryView)
        categoryView.addSubviews(logoView, experienceLabel, craftButton, bakingButton,
                         cultureButton, outdoorButton, sportButton, myPageLabel,
                         albumButton, sendGiftButton, getGiftButton,
                         customerServiceLabel, faqButton, mailButton)
        
        categoryView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(SizeLiterals.Screen.screenHeight * 70 / 812)
            $0.trailing.equalToSuperview().inset(79)
            $0.leading.equalToSuperview().inset(-20)
            $0.bottom.equalToSuperview().inset(bottomInset())
        }
        
        logoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        experienceLabel.snp.makeConstraints {
            $0.top.equalTo(logoView.snp.bottom).offset(29)
            $0.leading.equalTo(craftButton)
        }
        
        outdoorButton.snp.makeConstraints {
            $0.top.equalTo(experienceLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(49)
        }
        
        cultureButton.snp.makeConstraints {
            $0.top.equalTo(outdoorButton)
            $0.trailing.equalTo(outdoorButton.snp.leading).offset(-13)
        }
        
        bakingButton.snp.makeConstraints {
            $0.top.equalTo(outdoorButton)
            $0.trailing.equalTo(cultureButton.snp.leading).offset(-13)
        }
        
        craftButton.snp.makeConstraints {
            $0.top.equalTo(outdoorButton)
            $0.trailing.equalTo(bakingButton.snp.leading).offset(-13)
        }
        
        sportButton.snp.makeConstraints {
            $0.top.equalTo(craftButton.snp.bottom).offset(14)
            $0.leading.equalTo(craftButton)
        }
        
        myPageLabel.snp.makeConstraints {
            $0.top.equalTo(sportButton.snp.bottom).offset(21)
            $0.leading.equalTo(experienceLabel)
        }
        
        albumButton.snp.makeConstraints {
            $0.top.equalTo(myPageLabel.snp.bottom).offset(16)
            $0.leading.equalTo(sportButton)
        }
        
        sendGiftButton.snp.makeConstraints {
            $0.top.equalTo(albumButton)
            $0.leading.equalTo(bakingButton)
        }
        
        getGiftButton.snp.makeConstraints {
            $0.top.equalTo(albumButton)
            $0.leading.equalTo(cultureButton)
            $0.width.equalTo(48)
            $0.height.equalTo(68)
        }
        
        customerServiceLabel.snp.makeConstraints {
            $0.top.equalTo(albumButton.snp.bottom).offset(21)
            $0.leading.equalTo(albumButton)
        }
        
        faqButton.snp.makeConstraints {
            $0.top.equalTo(customerServiceLabel.snp.bottom).offset(16)
            $0.leading.equalTo(craftButton)
        }
        
        mailButton.snp.makeConstraints {
            $0.top.equalTo(faqButton)
            $0.leading.equalTo(bakingButton)
        }
    }
}

extension CategoryViewController {
    
    // MARK: - Methods
    
    private func bottomInset() -> CGFloat {
        return self.tabBarHeight + self.safeAreaBottomInset()
    }
    
    private func setTapScreen() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func dismissToCategory() {
        self.dismiss(animated: false, completion: nil)
    }
    
    private func pushToCategoryListVC(index: IndexPath) {
        experienceVC.categoryIndex = index
        self.navigationController?.pushViewController(experienceVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func handleBackgroundTap(_ gesture: UITapGestureRecognizer) {
        let touchLocation = gesture.location(in: self.view)
        guard let vc = self.presentingViewController else { return }
        
        if !categoryView.frame.contains(touchLocation) {
            // 모달을 호출한 뷰 컨트롤러가 탭바 컨트롤러인지 확인
            if let tabBarController = vc as? ShallWe.TabBarController {
                tabBarController.selectedIndex = 1
            }
            dismissToCategory()
        }
    }
}
