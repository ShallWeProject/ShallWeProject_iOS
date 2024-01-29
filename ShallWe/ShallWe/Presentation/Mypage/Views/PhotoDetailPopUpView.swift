//
//  MemoryPhotoPopUpView.swift
//  ShallWe
//
//  Created by 김나연 on 1/28/24.
//

import UIKit

import SnapKit

final class PhotoDetailPopUpView: UIView {

    // MARK: - Properties
    
    private var image: UIImage
    private static let IMAGE_WIDTH = SizeLiterals.Screen.screenWidth - (28*2 + 8*2)
    private static let IMAGE_MAX_HEIGHT = SizeLiterals.Screen.screenHeight * (474/768)
    private let IMAGE_MAX_RATIO = IMAGE_MAX_HEIGHT / IMAGE_WIDTH
    
    // MARK: - UI Components
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .gray0
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let closeButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString(I18N.MemoryPhotoAlbum.closeText, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.SB00_14)]))
        configuration.baseBackgroundColor = .bg4
        configuration.baseForegroundColor = .main
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
        configuration.background.cornerRadius = 100
        return UIButton(configuration: configuration)
    }()
    
    let deleteButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(I18N.MemoryPhotoAlbum.deleteText, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.fontGuide(.SB00_14)]))
        configuration.baseForegroundColor = .main
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
        return UIButton(configuration: configuration)
    }()
    
    // MARK: - Life Cycles
    
    init(frame: CGRect, image: UIImage) {
        self.image = image
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        resizeImage()
        
        super.draw(rect)
    }
}

// MARK: - Extensions

private extension PhotoDetailPopUpView {
    
    // MARK: - Methods
    
    func setUI() {
        backgroundColor = .black.withAlphaComponent(0.35)
    }
    
    func setHierarchy() {
        self.addSubviews(container)
        container.addSubviews(imageView, deleteButton, closeButton)
    }
    
    func setLayout() {
        container.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(28)
            $0.centerY.equalTo(safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(PhotoDetailPopUpView.IMAGE_WIDTH)
            $0.top.horizontalEdges.equalToSuperview().inset(8)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(13)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalTo(closeButton)
            $0.trailing.equalTo(closeButton.snp.leading).offset(-8)
        }
    }
    
    func resizeImage() {
        let originalRatio = image.size.height / image.size.width
        if originalRatio > IMAGE_MAX_RATIO {
            imageView.image = image.resize(newHeight: PhotoDetailPopUpView.IMAGE_MAX_HEIGHT)
        } else {
            imageView.image = image.resize(newWidth: PhotoDetailPopUpView.IMAGE_WIDTH)
        }
    }
}
