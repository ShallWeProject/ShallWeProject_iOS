//
//  ExperienceDetailView.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/01.
//

import UIKit

import SnapKit

final class ExperienceDetailView: UIView {
    
    // MARK: - UI Components
    
    private let segmentWidth = Int((SizeLiterals.Screen.screenWidth - 18) / 2)
    let explainDetailView = ExplainDetailView()
    let guideDetailView = GuideDetailView()
    
    let navigationBar: CustomNavigationBar = {
        let nav = CustomNavigationBar()
        nav.isLogoViewIncluded = true
        nav.isBackButtonIncluded = true
        return nav
    }()
    
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
    
    lazy var imageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let experienceTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black0
        label.font = .fontGuide(.SB00_14)
        return label
    }()
    
    private let experienceSubTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .fontGuide(.SB00_16_23)
        label.setLineSpacing(lineSpacing: 2.3)
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .main
        label.font = .fontGuide(.B00_20)
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .bg2
        return view
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        for (index, title) in [I18N.ExperienceDetail.segementTitle1, I18N.ExperienceDetail.segementTitle2].enumerated() {
            segment.insertSegment(withTitle: title, at: index, animated: true)
            segment.setWidth(SizeLiterals.Screen.screenWidth / 2, forSegmentAt: index)
        }
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray2,
            .font: UIFont.fontGuide(.SB00_14)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.point,
            .font: UIFont.fontGuide(.SB00_14)
        ]
        segment.setTitleTextAttributes(normalAttributes, for: .normal)
        segment.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .point
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gifButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.gift, for: .normal)
        button.setImage(ImageLiterals.Icon.gift, for: .highlighted)
        button.imageEdgeInsets.right = 8
        button.setTitle(I18N.ExperienceDetail.giftButton, for: .normal)
        button.setTitleColor(.bg0, for: .normal)
        button.titleLabel?.font = .fontGuide(.B00_14)
        button.backgroundColor = .point
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setRegisterCell()
        setAddTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
private extension ExperienceDetailView {
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, gifButton, scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(imageCollectionView, experienceTitle, experienceSubTitle, priceLabel, seperatorView, segmentControl, underLineView, guideDetailView, explainDetailView)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        gifButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(UIScreen.main.bounds.width * 335 / 375)
            $0.height.equalTo(43)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(gifButton.snp.top)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(self.snp.height).priority(.low)
        }
        
        imageCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(222)
        }
        
        experienceTitle.snp.makeConstraints {
            $0.top.equalTo(imageCollectionView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        experienceSubTitle.snp.makeConstraints {
            $0.top.equalTo(experienceTitle.snp.bottom).offset(5)
            $0.leading.equalTo(experienceTitle.snp.leading)
            $0.width.equalTo(218)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(experienceSubTitle.snp.top).offset(22)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(7)
            $0.height.equalTo(1)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(seperatorView.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview().inset(7)
            $0.height.equalTo(42)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom)
            $0.leading.equalTo(segmentControl.snp.leading).offset(7 + (segmentWidth - 156) / 2)
            $0.width.equalTo(156)
            $0.height.equalTo(2)
        }
        
        explainDetailView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(45)
        }
        
        guideDetailView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        ExperienceImageCollectionViewCell.register(collectionView: imageCollectionView)
        
    }
    
    func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
    }
    
    @objc
    func didChangeValue(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            explainDetailView.isHidden = false
            guideDetailView.isHidden = true
        case 1:
            explainDetailView.isHidden = true
            guideDetailView.isHidden = false
        default:
            break
        }
    }
    
    @objc
    func changeSegmentedControlLinePosition(_ segment: UISegmentedControl) {
        let leadingDistance = Int(7 + (segmentWidth - 156) / 2 + segmentWidth * segmentControl.selectedSegmentIndex)
        UIView.animate(withDuration: 0.2, animations: {
            self.underLineView.snp.updateConstraints { $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance) }
            self.layoutIfNeeded()
        })
    }
    
    func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}

extension ExperienceDetailView {
    
    func configureExperienceView(model: ExperienceDetailResponseDto) {
        experienceTitle.text = model.subtitle
        experienceSubTitle.text = model.title
        priceLabel.text = "\(formatNumber(model.price))원"
        priceLabel.partFontChange(targetString: "원", font: .fontGuide(.B00_14))
    }
}
