//
//  GalleryFooterView.swift
//  ShallWe
//
//  Created by KJ on 12/6/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class GalleryFooterView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    let galleryIndexLabel = UILabel()
    
    // MARK: - Properties
    
    var galleryCount: Int = GalleryModel.galleryDummydata().count
    private let disposeBag = DisposeBag()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryFooterView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.backgroundColor = .clear
        
        galleryIndexLabel.do {
            $0.text = "1 | \(galleryCount)"
            $0.font = .fontGuide(.SB00_12)
            $0.textColor = .white.withAlphaComponent(0.7)
            $0.textAlignment = .center
            $0.backgroundColor = .black_50
            $0.makeCornerRound(radius: 10)
            $0.partColorChange(targetString: "1", textColor: .white)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.addSubviews(galleryIndexLabel)
        
        galleryIndexLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func currentCellIndex(_ index: Int) {
        galleryIndexLabel.text = "\(index + 1) | \(galleryCount)"
        galleryIndexLabel.partColorChange(targetString: "\(index + 1)", textColor: .white)
    }
    
    func bind(input: Observable<Int>) {
        input
            .subscribe(onNext: { [weak self] currentPage in
                self?.currentCellIndex(currentPage)
            })
            .disposed(by: disposeBag)
    }
}
