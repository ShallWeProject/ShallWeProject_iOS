//
//  WithdrawalView.swift
//  ShallWe
//
//  Created by 김나연 on 1/21/24.
//

import UIKit

import SnapKit

final class WithdrawalView: UIView {

    // MARK: - Properties
    
    private let TABLEVIEW_INTRINSIC_HEIGHT = (39 * Double((ReasonForWithdrawal.allCases.count))) + (1.7 * 2)
    
    // MARK: - UI Components
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        navigationBar.isTitleLabelIncluded = true
        navigationBar.titleText = I18N.FAQ.withdrawalText
        return navigationBar
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let cautionLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.cautionText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        return label
    }()
    
    private let subIntroLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.checkWhatInfoisDeletedText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        label.numberOfLines = 0
        return label
    }()
    
    private let infoDeletedLabel: UILabel = {
        let label = UILabel()
        var strings: [String] = []
        InfoDeleted.allCases.forEach {
            strings.append($0.rawValue)
        }
        label.setBulletPointList(strings: strings)
        label.numberOfLines = 0
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.whatMadeYouUncomfortableText
        label.textColor = .black0
        label.font = .fontGuide(.SB00_16)
        label.numberOfLines = 0
        return label
    }()
    
    private let selectReasonView: UIView = {
        let view = UIView()
        view.makeBorder(width: 1.7, color: .gray0)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let selectReasonLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FAQ.selectReasonText
        label.textColor = .black0
        label.font = .fontGuide(.M00_14)
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Icon.arrow_down
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let reasonTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ReasonForWithdrawalTableViewCell.self, forCellReuseIdentifier: "ReasonForWithdrawalTableViewCell")
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 10
        tableView.makeBorder(width: 1.7, color: .gray0)
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = true
        tableView.isHidden = true
        tableView.alpha = 0
        return tableView
    }()
    
    let withdrawButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.FAQ.withdrawText, for: .normal)
        button.setTitleColor(.bg0, for: .normal)
        button.titleLabel?.font = .fontGuide(.SB00_14)
        button.backgroundColor = .gray2
        button.layer.cornerRadius = 10
//        button.isEnabled = false
        return button
    }()
    
    private var thanksView = UIView()
    private var shallWeLogo = UIImageView()
    private var thanksLabel = UILabel()
    var dialogBarrierView = UIView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        setTableViewHeightConstraint()
        super.draw(rect)
    }
}

// MARK: - Extensions

extension WithdrawalView {
    
    // MARK: - Methods
    
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        self.addSubviews(navigationBar, contentView)
        contentView.addSubviews(cautionLabel, subIntroLabel, infoDeletedLabel, questionLabel, selectReasonView, withdrawButton, reasonTableView)
        selectReasonView.addSubviews(selectReasonLabel, arrowIcon)
    }
    
    private func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        cautionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.leading.equalToSuperview().inset(20)
        }
        
        subIntroLabel.snp.makeConstraints {
            $0.top.equalTo(cautionLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(20)
        }
        
        infoDeletedLabel.snp.makeConstraints {
            $0.top.equalTo(subIntroLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(infoDeletedLabel.snp.bottom).offset(45)
            $0.leading.equalToSuperview().inset(20)
        }
        
        selectReasonView.snp.makeConstraints {
            $0.height.equalTo(45)
            $0.top.equalTo(questionLabel.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        selectReasonLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        arrowIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(1.5)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        reasonTableView.snp.makeConstraints {
            $0.top.equalTo(selectReasonView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        withdrawButton.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
        }
    }
    
    private func setDelegate() {
        reasonTableView.dataSource = self
        reasonTableView.delegate = self
    }
    
    private func setAddTarget() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectReasonViewDidTap))
        selectReasonView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func createDialogView() {
        thanksView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 10
            view.makeShadow(radius: 8, offset: CGSize(width: 0, height: 3), opacity: 0.2)
            return view
        }()
        
        shallWeLogo = {
            let imageView = UIImageView()
            imageView.image = ImageLiterals.FAQ.logo_shallWe_small
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        thanksLabel = {
            let label = UILabel()
            label.text = I18N.FAQ.thanksText
            label.textColor = .black
            label.font = .fontGuide(.R00_14)
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        
        dialogBarrierView = {
            let view = UIView()
            view.backgroundColor = .black.withAlphaComponent(0.3)
            return view
        }()
    }
    
    func setDialogLayout() {
        self.addSubview(dialogBarrierView)
        dialogBarrierView.addSubviews(thanksView)
        thanksView.addSubviews(shallWeLogo, thanksLabel)
        
        dialogBarrierView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        thanksView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        shallWeLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.centerX.equalToSuperview()
        }
        
        thanksLabel.snp.makeConstraints {
            $0.top.equalTo(shallWeLogo.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(25)
        }
    }
    
    private func setTableViewHeightConstraint() {
        let distance = withdrawButton.frame.minY - selectReasonView.frame.maxY
        reasonTableView.snp.makeConstraints {
            if (distance + 9) >= TABLEVIEW_INTRINSIC_HEIGHT {
                $0.height.equalTo(TABLEVIEW_INTRINSIC_HEIGHT).priority(.required)
                reasonTableView.bounces = false
            } else {
                $0.bottom.equalTo(withdrawButton.snp.top).offset(9)
            }
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func selectReasonViewDidTap() {
        reasonTableView.isHidden = !reasonTableView.isHidden
        
        UIView.animate(withDuration: 0.3, animations: { [self] in
            if reasonTableView.isHidden {
                self.reasonTableView.alpha = 0
                arrowIcon.image = ImageLiterals.Icon.arrow_down
            } else {
                self.reasonTableView.alpha = 1
                arrowIcon.image = ImageLiterals.Icon.arrow_up
            }
        })
    }
}

extension WithdrawalView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReasonForWithdrawal.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReasonForWithdrawalTableViewCell", for: indexPath) as? ReasonForWithdrawalTableViewCell else { return .init() }
        cell.configure(index: indexPath.row)
        return cell
    }
}

extension WithdrawalView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 39
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectReasonLabel.text = ReasonForWithdrawal.init(rawValue: indexPath.row)?.getDescription()
        reasonTableView.isHidden = true
        reasonTableView.alpha = 0
        arrowIcon.image = ImageLiterals.Icon.arrow_down
    }
}
