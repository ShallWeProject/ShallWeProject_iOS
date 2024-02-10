//
//  ExplainDetailView.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/04.
//

import UIKit

import SnapKit

final class ExplainDetailView: UIView {
    
    // MARK: - UI Components
    
    private let explainDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "기념일에 없으면 섭섭한 레터링 케이크\n\n그냥 주고받을때도 물론 기쁘지만,\n직접 만들 떄는 두 배로 즐거워요!"
        label.textColor = .black
        label.font = .fontGuide(.R00_14)
        label.numberOfLines = 0
        return label
    }()
    
    private let tableViewTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceDetail.tableViewTitle
        label.textColor = .black
        label.font = .fontGuide(.SB00_14)
        return label
    }()
    
    lazy var explainTableView: UITableView = {
        lazy var tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderTopPadding = 0
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = true
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    private let addressTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ExperienceDetail.addressTitle
        label.textColor = .black
        label.font = .fontGuide(.SB00_14)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "서울특별시 성동구 00로 12-34 2층"
        label.textColor = .black
        label.font = .fontGuide(.R00_14)
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExplainDetailView {
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        addSubviews(explainDetailLabel, tableViewTitle, explainTableView, addressTitle, addressLabel)
    }
    
    func setLayout() {
        explainDetailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(73)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(343)
        }
        
        tableViewTitle.snp.makeConstraints {
            $0.top.equalTo(explainDetailLabel.snp.bottom).offset(48)
            $0.leading.equalTo(explainDetailLabel.snp.leading)
        }
        
        explainTableView.snp.makeConstraints {
            $0.top.equalTo(tableViewTitle.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(417)
        }
        
        addressTitle.snp.makeConstraints {
            $0.top.equalTo(explainTableView.snp.bottom).offset(44)
            $0.leading.equalToSuperview().inset(16)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(addressTitle.snp.bottom).offset(12)
            $0.leading.equalTo(addressTitle.snp.leading)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        ExplainTableViewCell.register(tableView: explainTableView)
    }
}
