//
//  HomeViewModel.swift
//  ShallWe
//
//  Created by KJ on 12/3/23.
//

import UIKit

import RxSwift
import RxCocoa

protocol HomeViewModelInputs {
    func popularCategoryCellTap(at indexPath: IndexPath)
    func updateCurrentIndex(to index: Int)
    func recommendCellTap(at indexPath: IndexPath)
}

protocol HomeViewModelOutputs {
    var selectedPopularCellIndex: BehaviorRelay<IndexPath?> { get }
    var currentIndexSubject: BehaviorSubject<Int> { get }
    var selectedRecommendCellIndex: PublishSubject<IndexPath> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelInputs, HomeViewModelOutputs, HomeViewModelType {
    
    var recommend: BehaviorRelay<[RecommendModel]> = BehaviorRelay(value: [])
    var popularCategory: BehaviorRelay<[PopularCategoryModel]> = BehaviorRelay(value: [])
    var selectedPopularCellIndex: BehaviorRelay<IndexPath?> = BehaviorRelay<IndexPath?>(value: nil)
    var currentIndexSubject: BehaviorSubject<Int> = BehaviorSubject<Int>(value: 0)
    var selectedRecommendCellIndex: PublishSubject<IndexPath> = PublishSubject<IndexPath>()
    
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
    
    init(){
        self.getExperienceGift()
    }
    
    func popularCategoryCellTap(at indexPath: IndexPath) {
        selectedPopularCellIndex.accept(indexPath)
    }
    
    func updateCurrentIndex(to index: Int) {
        currentIndexSubject.onNext(index)
    }
    
    func recommendCellTap(at indexPath: IndexPath) {
        selectedRecommendCellIndex.onNext(indexPath)
    }
}

extension HomeViewModel {
    
    func getExperienceGift() {
        HomeAPI.shared.getExperienceGift() { [weak self] response in
            guard let status = response?.status else { return }
            guard self != nil else { return }
            guard let data = response?.data else { return }
        }
    }
}
