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
    func dropDownButtonTap(at type: DropDownTitleType)
    func dropDownMenuSelect(at type: DropDownTitleType)
}

protocol HomeExperienceListViewModelOutputs {
    var dropDownAlert: PublishSubject<DropDownTitleType> { get }
    var dropDownTitleChange: PublishSubject<DropDownTitleType> { get }
}

protocol HomeExperienceListViewModelType {
    var inputs: HomeExperienceListViewModelInputs { get }
    var outputs: HomeExperienceListViewModelOutputs { get }
}

final class HomeExperienceListViewModel: HomeExperienceListViewModelInputs, HomeExperienceListViewModelOutputs, HomeExperienceListViewModelType {
    
    var dropDownAlert: PublishSubject<DropDownTitleType> = PublishSubject<DropDownTitleType>()
    var dropDownTitleChange: PublishSubject<DropDownTitleType> = PublishSubject<DropDownTitleType>()
    
    var inputs: HomeExperienceListViewModelInputs { return self }
    var outputs: HomeExperienceListViewModelOutputs { return self }
    
    init(){

    }
    
    func dropDownButtonTap(at type: DropDownTitleType) {
        self.dropDownAlert.onNext(type)
    }
    
    func dropDownMenuSelect(at type: DropDownTitleType) {
        self.dropDownTitleChange.onNext(type)
    }
}
