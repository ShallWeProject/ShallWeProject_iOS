//
//  HomeExperienceViewModel.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

import RxSwift
import RxCocoa

protocol HomeExperienceViewModelInputs {
    func menuCellTap(at indexPath: IndexPath)
    func sortButtonTap()
    func sortType(indexPath: IndexPath)
}

protocol HomeExperienceViewModelOutputs {
    var recommendMenu: BehaviorRelay<[HomeExperienceType]> { get }
    var categoryMenu: BehaviorRelay<[HomeExperienceType]> { get }
    var setMenuCell: BehaviorRelay<IndexPath> { get }
    var isSelectedMenuCell: PublishSubject<IndexPath> { get }
    var presentSortModal: PublishSubject<Void> { get }
    var sortTypeChange: BehaviorRelay<IndexPath> { get }
}

protocol HomeExperienceViewModelType {
    var inputs: HomeExperienceViewModelInputs { get }
    var outputs: HomeExperienceViewModelOutputs { get }
}

final class HomeExperienceViewModel: HomeExperienceViewModelInputs, HomeExperienceViewModelOutputs, HomeExperienceViewModelType {
    
    var recommendMenu: BehaviorRelay<[HomeExperienceType]> = BehaviorRelay(value: [])
    var categoryMenu: BehaviorRelay<[HomeExperienceType]> = BehaviorRelay(value: [])
    var isSelectedMenuCell: PublishSubject<IndexPath> = PublishSubject<IndexPath>()
    var setMenuCell: BehaviorRelay<IndexPath> = BehaviorRelay<IndexPath>(value: IndexPath(item: 0, section: 0))
    var presentSortModal: PublishSubject<Void> = PublishSubject<Void>()
    var sortTypeChange: BehaviorRelay<IndexPath> = BehaviorRelay<IndexPath>(value: IndexPath(row: 0, section: 0))
    
    var inputs: HomeExperienceViewModelInputs { return self }
    var outputs: HomeExperienceViewModelOutputs { return self }
    
    init(){
        self.recommendMenu.accept(HomeExperienceType.recommendMenu())
        self.categoryMenu.accept(HomeExperienceType.categoryMenu())
        self.setMenuCell.accept(IndexPath(item: 0, section: 0))
    }
    
    func menuCellTap(at indexPath: IndexPath) {
        self.isSelectedMenuCell.onNext(indexPath)
    }
    
    func sortButtonTap() {
        self.presentSortModal.onNext(())
    }
    
    func sortType(indexPath: IndexPath) {
        self.sortTypeChange.accept(indexPath)
    }
}
