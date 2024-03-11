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
//    func sortType(indexPath: IndexPath)
    func presentSortModal()
    func sortTypeTap(title: String)
}

protocol HomeExperienceViewModelOutputs {
    var recommendMenu: BehaviorRelay<[HomeExperienceType]> { get }
    var categoryMenu: BehaviorRelay<[HomeExperienceType]> { get }
    var setMenuCell: BehaviorRelay<IndexPath> { get }
    var isSelectedMenuCell: PublishSubject<IndexPath> { get }
//    var presentSortModal: PublishSubject<Void> { get }
//    var sortTypeChange: BehaviorRelay<IndexPath> { get }
    var expCategory: BehaviorRelay<[SectionOfHomeExperience]> { get }
    var sortMenu: BehaviorRelay<[SortModel]> { get }
    var changeSortType: PublishSubject<String> { get }
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
//    var presentSortModal: PublishSubject<Void> = PublishSubject<Void>()
//    var sortTypeChange: BehaviorRelay<IndexPath> = BehaviorRelay<IndexPath>(value: IndexPath(row: 0, section: 0))
    var expCategory: BehaviorRelay<[SectionOfHomeExperience]> = BehaviorRelay<[SectionOfHomeExperience]>(value: [])
    var sortMenu: BehaviorRelay<[SortModel]> = BehaviorRelay<[SortModel]>(value: [])
    var changeSortType: PublishSubject<String> = PublishSubject<String>()
    
    var inputs: HomeExperienceViewModelInputs { return self }
    var outputs: HomeExperienceViewModelOutputs { return self }
    
    init(){
        self.recommendMenu.accept(HomeExperienceType.recommendMenu())
        self.categoryMenu.accept(HomeExperienceType.categoryMenu())
        self.setMenuCell.accept(IndexPath(item: 0, section: 0))
        self.expCategory.accept(SectionOfHomeExperience.homeExperienceSectionDummy())
    }
    
    func presentSortModal() {
        self.sortMenu.accept(SortModel.sortData())
    }
    
    func menuCellTap(at indexPath: IndexPath) {
        self.isSelectedMenuCell.onNext(indexPath)
    }
    
//    func sortType(indexPath: IndexPath) {
//        print("viewModel", indexPath)
//        self.sortTypeChange.accept(indexPath)
//    }
    
    func sortTypeTap(title: String) {
        self.changeSortType.onNext(title)
    }
    
}
