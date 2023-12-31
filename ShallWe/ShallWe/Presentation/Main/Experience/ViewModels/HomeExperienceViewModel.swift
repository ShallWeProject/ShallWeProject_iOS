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
}

protocol HomeExperienceViewModelOutputs {
    var recommendMenu: BehaviorRelay<[HomeExperienceType]> { get }
    var categoryMenu: BehaviorRelay<[HomeExperienceType]> { get }
    var setMenuCell: BehaviorRelay<IndexPath> { get }
    var isSelectedMenuCell: PublishSubject<IndexPath> { get }
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
    
    var inputs: HomeExperienceViewModelInputs { return self }
    var outputs: HomeExperienceViewModelOutputs { return self }
    
    init(){
        self.recommendMenu.accept(HomeExperienceType.recommendMenu())
        self.categoryMenu.accept(HomeExperienceType.experienceMenu())
        self.setMenuCell.accept(IndexPath(item: 0, section: 0))
    }
    
    func menuCellTap(at indexPath: IndexPath) {
        self.isSelectedMenuCell.onNext(indexPath)
    }
}
