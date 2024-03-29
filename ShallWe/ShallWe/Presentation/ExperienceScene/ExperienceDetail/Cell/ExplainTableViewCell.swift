//
//  ExplainTableViewCell.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/04.
//

import UIKit

import SnapKit
import Kingfisher

final class ExplainTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - UI Components
    
    private let explainTitle: UILabel = {
        let label = UILabel()
        label.text = "1단계: 000하기"
        label.font = .fontGuide(.B00_12)
        label.textColor = .black
        return label
    }()
    
    private let explainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "example2")
        return image
    }()
    
    private let explainSubTitle: UILabel = {
        let label = UILabel()
        label.text = "상세한 설명입니다"
        label.font = .fontGuide(.R00_12)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let circleView: UIView = {
        let circle = UIView()
        circle.layer.backgroundColor = UIColor.line1.cgColor
        circle.layer.cornerRadius = 5
        return circle
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.layer.backgroundColor = UIColor.line1.cgColor
        return line
    }()
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ExplainTableViewCell {
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        addSubviews(circleView, lineView, explainTitle, explainImage, explainSubTitle)
    }
    
    func setLayout() {
        circleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(10)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(circleView.snp.bottom)
            $0.leading.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(2)
        }
        
        explainTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(lineView.snp.trailing).offset(15)
            $0.width.equalTo(290)
        }
        
        explainImage.snp.makeConstraints {
            $0.top.equalTo(explainTitle.snp.bottom).offset(13)
            $0.leading.equalTo(explainTitle.snp.leading)
            $0.height.equalTo(45)
        }
        
        explainSubTitle.snp.makeConstraints {
            $0.top.equalTo(explainImage.snp.bottom).offset(12)
            $0.leading.equalTo(explainTitle.snp.leading)
            $0.width.equalTo(290)
        }
    }
}


extension ExplainTableViewCell {
    
    func configureCell(model: Explanation) {
        explainTitle.text = model.stage
        explainImage.kf.setImage(with: URL(string: model.explanationURL))
        explainSubTitle.text = model.description
        explainImage.isHidden = false
        explainSubTitle.isHidden = false
        lineView.isHidden = false
    }
    
    func configureLastCell() {
        explainTitle.text = "완성"
        explainImage.isHidden = true
        explainSubTitle.isHidden = true
        lineView.isHidden = true
    }
}
