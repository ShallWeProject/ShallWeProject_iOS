//
//  HomeExperienceListViewModel.swift
//  ShallWe
//
//  Created by KJ on 12/13/23.
//

import UIKit

import RxSwift
import RxCocoa

protocol HomeExperienceListViewModelInputs {
}

protocol HomeExperienceListViewModelOutputs {

}

protocol HomeExperienceListViewModelType {
    var inputs: HomeExperienceListViewModelInputs { get }
    var outputs: HomeExperienceListViewModelOutputs { get }
}

final class HomeExperienceListViewModel: HomeExperienceListViewModelInputs, HomeExperienceListViewModelOutputs, HomeExperienceListViewModelType {
    
    var inputs: HomeExperienceListViewModelInputs { return self }
    var outputs: HomeExperienceListViewModelOutputs { return self }
    
    init(){

    }
}
