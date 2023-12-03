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
}

protocol HomeViewModelOutputs {
    var selectedCellIndex: BehaviorRelay<IndexPath?> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelInputs, HomeViewModelOutputs, HomeViewModelType {
    
    var selectedCellIndex: BehaviorRelay<IndexPath?> = BehaviorRelay<IndexPath?>(value: nil)
    
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
    
    init(){}
    
    func popularCategoryCellTap(at indexPath: IndexPath) {
        selectedCellIndex.accept(indexPath)
    }
}
