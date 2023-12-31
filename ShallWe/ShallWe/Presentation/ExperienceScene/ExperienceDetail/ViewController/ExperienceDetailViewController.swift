//
//  ExperienceDetailViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/01.
//

import UIKit

final class ExperienceDetailViewController: UIViewController {
    
    private let experienceDetailView = ExperienceDetailView()
    private lazy var imageCollectionView = experienceDetailView.imageCollectionView
    private lazy var explainTableView = experienceDetailView.explainDetailView.explainTableView
    
    override func loadView() {
        super.loadView()
        
        view = experienceDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setDelegate()
    }
}

extension ExperienceDetailViewController {
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Icon.arrow_left,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.width = 30.0
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        let label = UILabel()
        label.text = I18N.Common.appTitle
        label.font = .boldSystemFont(ofSize: 20)
        navigationItem.titleView = label
    }
    
    @objc
    func backButtonTapped() {
        print("✅")
        self.navigationController?.popViewController(animated: true)
    }
    
    func setDelegate() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        explainTableView.delegate = self
        explainTableView.dataSource = self
    }
}

extension ExperienceDetailViewController: UICollectionViewDelegate {
    
}

extension ExperienceDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ExperienceImageCollectionViewCell.dequeueReusableCell(collectionView: imageCollectionView, indexPath: indexPath)
        return cell
    }
}

extension ExperienceDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 222)
    }
}

extension ExperienceDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension ExperienceDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ExplainTableViewCell.dequeueReusableCell(tableView: explainTableView)
        return cell
    }
}
