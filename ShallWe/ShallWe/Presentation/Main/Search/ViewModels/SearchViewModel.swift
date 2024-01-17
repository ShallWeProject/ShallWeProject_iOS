//
//  SearchViewModel.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import UIKit

import RxSwift
import RxCocoa

protocol SearchViewModelInputs {
    
}

protocol SearchViewModelOutputs {
    
}

protocol SearchViewModelType {
    
}

final class SearchViewModel: SearchViewModelInputs, SearchViewModelOutputs, SearchViewModelType {
    
    var inputs: SearchViewModelInputs { return self }
    var outputs: SearchViewModelOutputs { return self }
    
    init() {}
}
