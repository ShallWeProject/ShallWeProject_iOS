//
//  ExperienceViewModel.swift
//  ShallWe
//
//  Created by KJ on 12/12/23.
//

import UIKit

import RxSwift
import RxCocoa

protocol ExperienceViewModelInputs {
    func menuCellTap(at indexPath: IndexPath)
}

protocol ExperienceViewModelOutputs {
    var recommendMenu: BehaviorRelay<[ExperienceType]> { get }
    var categoryMenu: BehaviorRelay<[ExperienceType]> { get }
    var setMenuCell: BehaviorRelay<IndexPath> { get }
    var menuSelected: PublishSubject<IndexPath> { get }
}

protocol ExperienceViewModelType {
    var inputs: ExperienceViewModelInputs { get }
    var outputs: ExperienceViewModelOutputs { get }
}

final class ExperienceViewModel: ExperienceViewModelInputs, ExperienceViewModelOutputs, ExperienceViewModelType {
    
    var recommendMenu: BehaviorRelay<[ExperienceType]> = BehaviorRelay(value: [])
    var categoryMenu: BehaviorRelay<[ExperienceType]> = BehaviorRelay(value: [])
    var menuSelected: PublishSubject<IndexPath> = PublishSubject<IndexPath>()
    var setMenuCell: BehaviorRelay<IndexPath> = BehaviorRelay<IndexPath>(value: IndexPath(item: 0, section: 0))
    
    var inputs: ExperienceViewModelInputs { return self }
    var outputs: ExperienceViewModelOutputs { return self }
    
    init(){
        self.recommendMenu.accept(ExperienceType.recommendMenu())
        self.categoryMenu.accept(ExperienceType.categoryMenu())
        self.setMenuCell.accept(IndexPath(item: 0, section: 0))
    }
    
    func menuCellTap(at indexPath: IndexPath) {
        self.menuSelected.onNext(indexPath)
    }
}
