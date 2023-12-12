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

}

protocol ExperienceViewModelOutputs {
    var recommendMenu: BehaviorRelay<[ExperienceType]> { get }
    var categoryMenu: BehaviorRelay<[ExperienceType]> { get }
}

protocol ExperienceViewModelType {
    var inputs: ExperienceViewModelInputs { get }
    var outputs: ExperienceViewModelOutputs { get }
}

final class ExperienceViewModel: ExperienceViewModelInputs, ExperienceViewModelOutputs, ExperienceViewModelType {
    
    var recommendMenu: BehaviorRelay<[ExperienceType]> = BehaviorRelay(value: [])
    var categoryMenu: BehaviorRelay<[ExperienceType]> = BehaviorRelay(value: [])
    
    var inputs: ExperienceViewModelInputs { return self }
    var outputs: ExperienceViewModelOutputs { return self }
    
    init(){
        self.recommendMenu.accept(ExperienceType.recommendMenu())
        self.categoryMenu.accept(ExperienceType.categoryMenu())
    }

}
