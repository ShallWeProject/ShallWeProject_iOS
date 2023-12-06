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
}

protocol HomeViewModelOutputs {
    var selectedCellIndex: BehaviorRelay<IndexPath?> { get }
    var currentIndexSubject: BehaviorSubject<Int> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelInputs, HomeViewModelOutputs, HomeViewModelType {
    
    var selectedCellIndex: BehaviorRelay<IndexPath?> = BehaviorRelay<IndexPath?>(value: nil)
    var currentIndexSubject: BehaviorSubject<Int> = BehaviorSubject<Int>(value: 0)
    
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
    
    init(){}
    
    func popularCategoryCellTap(at indexPath: IndexPath) {
        selectedCellIndex.accept(indexPath)
    }
    
    func updateCurrentIndex(to index: Int) {
        currentIndexSubject.onNext(index)
    }
}
