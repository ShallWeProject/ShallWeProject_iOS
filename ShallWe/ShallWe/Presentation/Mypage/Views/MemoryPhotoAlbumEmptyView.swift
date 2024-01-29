//
//  MemoryPhotoAlbumEmptyView.swift
//  ShallWe
//
//  Created by 김나연 on 1/30/24.
//

import UIKit

import SnapKit

final class MemoryPhotoAlbumEmptyView: UIView {

    // MARK: - UI Components
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        navigationBar.isLogoViewIncluded = true
        return navigationBar
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = I18N.MemoryPhotoAlbum.noMemoryText
        label.textColor = .gray4
        label.font = .fontGuide(.SB00_14)
        return label
    }()
    
    private let layoutGuide = UILayoutGuide()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension MemoryPhotoAlbumEmptyView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(navigationBar, label)
        self.addLayoutGuide(layoutGuide)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        layoutGuide.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        label.snp.makeConstraints {
            $0.center.equalTo(layoutGuide)
        }
    }
}
