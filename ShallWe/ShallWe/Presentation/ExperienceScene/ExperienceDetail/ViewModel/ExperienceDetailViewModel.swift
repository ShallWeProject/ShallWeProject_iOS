//
//  ExperienceDetailViewModel.swift
//  ShallWe
//
//  Created by 고아라 on 2/10/24.
//

import UIKit

protocol ExperienceDetailViewModelInputs {
    func experienceDetail(giftId: Int)
}

protocol ExperienceDetailViewModelOutputs {
    var experienceDetail: ExperienceDetailResponseDto? { get }
}

protocol ExperienceDetailViewModelType {
    var inputs: ExperienceDetailViewModelInputs { get }
    var outputs: ExperienceDetailViewModelOutputs { get }
}

class ExperienceDetailObservable<T> {
    typealias Observer = (T) -> Void
    var observer: Observer?
    
    func observe(observer: @escaping Observer) {
        self.observer = observer
    }
    
    func emit(_ value: T) {
        observer?(value)
    }
}

final class ExperienceDetailViewModel: ExperienceDetailViewModelInputs, ExperienceDetailViewModelOutputs, ExperienceDetailViewModelType {
    
    private var experienceDetailObservable = ExperienceDetailObservable<ExperienceDetailResponseDto?>()
    
    var experienceDetail: ExperienceDetailResponseDto? {
        didSet {
            experienceDetailObservable.emit(experienceDetail)
        }
    }
    
    func observeExperienceDetail(_ observer: @escaping ExperienceDetailObservable<ExperienceDetailResponseDto?>.Observer) {
        experienceDetailObservable.observe(observer: observer)
    }
    
    var inputs: ExperienceDetailViewModelInputs { return self }
    var outputs: ExperienceDetailViewModelOutputs { return self }
    
    init(){
        getExperienceDetail(giftId: 1)
    }
    
    func experienceDetail(giftId: Int) {
        self.getExperienceDetail(giftId: giftId)
    }
}

extension ExperienceDetailViewModel {
    
    func getExperienceDetail(giftId: Int) {
        ExperienceAPI.shared.getExperienceDetail(giftId: giftId) { [weak self] response in
            guard (response?.status) != nil else { return }
            guard self != nil else { return }
            guard let data = response?.data else { return }
            self?.experienceDetail = data
        }
    }
}
