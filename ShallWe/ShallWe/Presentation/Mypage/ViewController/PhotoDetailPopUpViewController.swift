//
//  MemoryPhotoPopUpViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/28/24.
//

import UIKit

final class PhotoDetailPopUpViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var photoDetailPopUpView: PhotoDetailPopUpView
    
    // MARK: - Life Cycles
    
    init(image: UIImage) {
        self.photoDetailPopUpView = PhotoDetailPopUpView(frame: .zero, image: image)
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = photoDetailPopUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTarget()
    }
}

// MARK: - Extensions

private extension PhotoDetailPopUpViewController {
    
    func setAddTarget() {
        photoDetailPopUpView.closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        photoDetailPopUpView.deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc 
    func closeButtonDidTap() {
        self.dismiss(animated: false)
    } 
    
    @objc
    func deleteButtonDidTap() {
        
    }
}
