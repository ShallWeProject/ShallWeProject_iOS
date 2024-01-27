//
//  MemoryPhotoAlbumViewController.swift
//  ShallWe
//
//  Created by 김나연 on 1/27/24.
//

import UIKit

final class MemoryPhotoAlbumViewController: UIViewController {

    // MARK: - UI Components
    
    private let memoryPhotoAlbumView = MemoryPhotoAlbumView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = memoryPhotoAlbumView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension MemoryPhotoAlbumViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setAddTarget() {
        memoryPhotoAlbumView.navigationBar.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
