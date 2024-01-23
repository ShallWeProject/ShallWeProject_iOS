//
//  MyPageView.swift
//  ShallWe
//
//  Created by 고아라 on 1/23/24.
//

import UIKit

import SnapKit

final class MyPageView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private var mypageReceiverView = MyPageReceiverView()
    private var mypageSenderView = MyPageSenderView()
    
    private let navigationBar: CustomNavigationBar = {
        let navigation = CustomNavigationBar()
        navigation.isLogoViewIncluded = true
        return navigation
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        for (index, title) in ["보낸 선물함", "받은 선물함"].enumerated() {
            segment.insertSegment(withTitle: title, at: index, animated: true)
            segment.setWidth((UIScreen.main.bounds.width - 14) / 2, forSegmentAt: index)
        }
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray2,
            .font: UIFont.fontGuide(.SB00_14)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.main,
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
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .bg3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MyPageView {
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, segmentControl, underLineView, seperatorView, mypageSenderView, mypageReceiverView)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(43)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom)
            $0.leading.equalTo(segmentControl.snp.leading).offset(28)
            $0.width.equalTo(117)
            $0.height.equalTo(3)
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        mypageSenderView.snp.makeConstraints {
            $0.top.equalTo(seperatorView.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        mypageReceiverView.snp.makeConstraints {
            $0.top.equalTo(seperatorView.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
    }
    
    @objc
    func didChangeValue(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            mypageReceiverView.isHidden = false
            mypageSenderView.isHidden = true
        case 1:
            mypageReceiverView.isHidden = true
            mypageSenderView.isHidden = false
        default:
            break
        }
    }
    
    @objc
    func changeSegmentedControlLinePosition(_ segment: UISegmentedControl) {
        UIView.animate(withDuration: 0.2, animations: {
            if segment.selectedSegmentIndex == 0 {
                self.underLineView.snp.remakeConstraints {
                    $0.top.equalTo(self.segmentControl.snp.bottom)
                    $0.leading.equalTo(self.segmentControl.snp.leading).offset(28)
                    $0.width.equalTo(117)
                    $0.height.equalTo(3)
                }
            } else if segment.selectedSegmentIndex == 1 {
                self.underLineView.snp.remakeConstraints {
                    $0.top.equalTo(self.segmentControl.snp.bottom)
                    $0.trailing.equalTo(self.segmentControl.snp.trailing).offset(-49)
                    $0.width.equalTo(117)
                    $0.height.equalTo(3)
                }
            }
            self.layoutIfNeeded()
        })
    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
}
