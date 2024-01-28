//
//  MemoryPhotoAlbumView.swift
//  ShallWe
//
//  Created by 김나연 on 1/28/24.
//

import UIKit

import SnapKit

final class MemoryPhotoAlbumView: UIView {

    // MARK: - Properties
    
    private static let date: String = "2023.05.23"
    
    // MARK: - UI Components
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        navigationBar.isLogoViewIncluded = true
        return navigationBar
    }()
    
    private let dateHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        let text = date + I18N.MemoryPhotoAlbum.memoryText
        let attributedString = NSMutableAttributedString(string: text, attributes: [.font : UIFont.fontGuide(.M00_14), .foregroundColor: UIColor.black0])
        attributedString.addAttribute(.foregroundColor, value: UIColor.main, range: NSString(string: text).range(of: date))
        attributedString.addAttribute(.font, value: UIFont.fontGuide(.B00_14), range: NSString(string: text).range(of: date))
        label.attributedText = attributedString
        return label
    }()
    
    let leftButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .gray0
        configuration.image = ImageLiterals.Icon.left_calender
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 7.5, leading: 7.5, bottom: 7.5, trailing: 7.5)
        configuration.background.cornerRadius = 10
        return UIButton(configuration: configuration)
    }()
    
    let rightButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .gray0
        configuration.image = ImageLiterals.Icon.right_calender
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 7.5, leading: 7.5, bottom: 7.5, trailing: 7.5)
        configuration.background.cornerRadius = 10
        return UIButton(configuration: configuration)
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let experienceNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        view.layer.cornerRadius = 10
        view.makeBorder(width: 2, color: .bg4)
        return view
    }()
    
    private let experienceCategory: UILabel = {
        let label = UILabel()
        label.text = "[인천] 인기 이색체험"
        label.textColor = .black0
        label.font = .fontGuide(.SB00_14)
        label.numberOfLines = 0
        return label
    }()
    
    private let experienceTitle: UILabel = {
        let label = UILabel()
        label.text = "Y2K 감성 제대로 느끼고 싶을 땐, 추억의 캔모아"
        label.textColor = .black
        label.font = .fontGuide(.M00_14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 18
        flowLayout.minimumInteritemSpacing = 18
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension MemoryPhotoAlbumView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, dateHeader, divider, scrollView)
        dateHeader.addSubviews(dateLabel, leftButton, rightButton)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(experienceNameView, collectionView)
        experienceNameView.addSubviews(experienceCategory, experienceTitle)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        dateHeader.snp.makeConstraints {
            $0.height.equalTo(53)
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.leading.equalToSuperview().inset(64)
            $0.centerY.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.trailing.equalToSuperview().inset(64)
            $0.centerY.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(dateHeader.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(8)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.edges.equalTo(scrollView.contentLayoutGuide)
        }
        
        experienceNameView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        experienceCategory.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(30)
        }
        
        experienceTitle.snp.makeConstraints {
            $0.top.equalTo(experienceCategory.snp.bottom).offset(2.5)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        collectionView.snp.makeConstraints {
            $0.height.equalTo(1000)
            $0.top.equalTo(experienceNameView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
    
    func registerCell() {
        MemoryPhotoAlbumCollectionViewCell.register(collectionView: collectionView)
    }
}
