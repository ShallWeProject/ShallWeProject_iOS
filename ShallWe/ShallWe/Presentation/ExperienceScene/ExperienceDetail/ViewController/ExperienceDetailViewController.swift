//
//  ExperienceDetailViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/01.
//

import UIKit

final class ExperienceDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = ExperienceDetailViewModel()
    
    // MARK: - UI Components
    
    private let experienceDetailView = ExperienceDetailView()
    private lazy var imageCollectionView = experienceDetailView.imageCollectionView
    private lazy var explainTableView = experienceDetailView.explainDetailView.explainTableView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        
        view = experienceDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDelegate()
        bindViewModel()
        setAddTarget()
    }
}

extension ExperienceDetailViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }

    func bindViewModel() {
        viewModel.observeExperienceDetail { [weak self] experienceDetail in
            guard let experienceDetail = experienceDetail else { return }
            self?.experienceDetailView.configureExperienceView(model: experienceDetail)
            self?.experienceDetailView.explainDetailView.configureExplainView(model: experienceDetail)
            self?.experienceDetailView.guideDetailView.configureGuideView(model: experienceDetail)
            self?.explainTableView.reloadData()
            self?.experienceDetailView.imageCollectionView.reloadData()
        }
    }
    
    func setAddTarget() {
        experienceDetailView.gifButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        let nav = ExperienceGiftViewController(viewModel: self.viewModel)
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    func setDelegate() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        explainTableView.delegate = self
        explainTableView.dataSource = self
        experienceDetailView.navigationBar.delegate = self
    }
}

extension ExperienceDetailViewController: UICollectionViewDelegate {
    
}

extension ExperienceDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.experienceDetail?.giftImgURL.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ExperienceImageCollectionViewCell.dequeueReusableCell(collectionView: imageCollectionView, indexPath: indexPath)
        guard let data = viewModel.experienceDetail else {
            return cell
        }
        cell.configureCell(img: data.giftImgURL[indexPath.row])
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
        switch indexPath.row {
        case 3:
            return 20
        default:
            return 110
        }
    }
}

extension ExperienceDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ExplainTableViewCell.dequeueReusableCell(tableView: explainTableView)
        switch indexPath.row {
        case 3:
            cell.configureLastCell()
        default:
            guard let explanation = viewModel.experienceDetail?.explanation[indexPath.row] else {
                return cell
            }
            cell.configureCell(model: explanation)
        }
        return cell
    }
}

extension ExperienceDetailViewController: NavigationBarProtocol {
    
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
