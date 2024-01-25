//
//  MyPageViewController.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import UIKit

final class MyPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let receiverDummy = MyPageReceiverEntity.receiveDummy()
    private let senderDummy = MyPageSenderEntity.senderDummy()
    
    // MARK: - UI Components
    
    private let myPageView = MyPageView()
    private lazy var receiverCollectionview = myPageView.mypageReceiverView.collectionView
    private lazy var senderCollectionview = myPageView.mypageSenderView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDelegate()
        setGesture()
    }
}

// MARK: - Extensions

extension MyPageViewController {

    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setDelegate() {
        receiverCollectionview.delegate = self
        receiverCollectionview.dataSource = self
        senderCollectionview.delegate = self
        senderCollectionview.dataSource = self
    }
    
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(albumTapped))
        myPageView.albumView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func albumTapped() {
        print("albumTapped")
    }
}

extension MyPageViewController: MypageDelegate {
    
    func editButtonTapped() {
        let nav = ExperienceGiftViewController()
        nav.fromMypage = true
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    func cancelButtonTapped() {
        self.makeTwoButtonAlert(title: I18N.Mypage.cancelTitle, message: I18N.Mypage.cancelMessage, leftTitle: I18N.Mypage.alertLeftTitle, rightTitle: I18N.Mypage.alertRightTitle, rightAction: {
            self.makeAlert(title: "", message: I18N.Mypage.alertCancelTitle)
        })
    }
}

extension MyPageViewController: UICollectionViewDelegate {
}

extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case receiverCollectionview:
            if indexPath.item == 0 {
                return CGSize(width: SizeLiterals.Screen.screenWidth * 329 / 375, height: 108)
            } else {
                return CGSize(width: SizeLiterals.Screen.screenWidth * 329 / 375, height: 340)
            }
        case senderCollectionview:
            if indexPath.item == 0 {
                return CGSize(width: SizeLiterals.Screen.screenWidth * 329 / 375, height: 108)
            } else {
                return CGSize(width: SizeLiterals.Screen.screenWidth * 329 / 375, height: 378)
            }
        default:
            return CGSize()
        }
    }
}

extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case receiverCollectionview:
            let cell = MyPageReceiverCollectionViewCell.dequeueReusableCell(collectionView: receiverCollectionview, indexPath: indexPath)
            cell.setDataBind(model: receiverDummy[indexPath.item])
            return cell
        case senderCollectionview:
            let cell = MyPageSenderCollectionViewCell.dequeueReusableCell(collectionView: senderCollectionview, indexPath: indexPath)
            cell.setDataBind(model: senderDummy[indexPath.item])
            cell.delegate = self
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case receiverCollectionview:
            return receiverDummy.count
        case senderCollectionview:
            return senderDummy.count
        default:
            return 0
        }
    }
}
