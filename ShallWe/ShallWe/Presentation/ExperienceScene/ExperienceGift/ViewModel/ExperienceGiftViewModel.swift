//
//  ExperienceGiftViewModel.swift
//  ShallWe
//
//  Created by 고아라 on 2/15/24.
//

import UIKit

protocol ExperienceGiftViewModelInputs {
    func reservationDate(giftId: Int, date: String)
}

protocol ExperienceGiftViewModelOutputs {
    var reservationDate: [ReservationDateResponseDto]? { get }
}

protocol ExperienceGiftViewModelType {
    var inputs: ExperienceGiftViewModelInputs { get }
    var outputs: ExperienceGiftViewModelOutputs { get }
}

class ExperienceGiftObservable<T> {
    typealias Observer = (T) -> Void
    var observer: Observer?
    
    func observe(observer: @escaping Observer) {
        self.observer = observer
    }
    
    func emit(_ value: T) {
        observer?(value)
    }
}

final class ExperienceGiftViewModel: ExperienceGiftViewModelInputs, ExperienceGiftViewModelOutputs, ExperienceGiftViewModelType {
    
    private var experienceGiftObservable = ExperienceGiftObservable<[ReservationDateResponseDto]?>()
    
    var reservationDate: [ReservationDateResponseDto]? {
        didSet {
            experienceGiftObservable.emit(reservationDate)
        }
    }
    
    func observeExperienceGift(_ observer: @escaping ExperienceGiftObservable<[ReservationDateResponseDto]?>.Observer) {
        experienceGiftObservable.observe(observer: observer)
    }
    
    var inputs: ExperienceGiftViewModelInputs { return self }
    var outputs: ExperienceGiftViewModelOutputs { return self }
    
    init(){
        reservationDate(giftId: 1, date: "2024-02-08")
    }
    
    func reservationDate(giftId: Int, date: String) {
        self.getReservationDate(giftId: giftId, date: date)
    }
}

extension ExperienceGiftViewModel {
    
    func getReservationDate(giftId: Int,  date: String) {
        ExperienceAPI.shared.getReservationDate(giftId: giftId, date: date) { [weak self] response in
            guard (response?.status) != nil else { return }
            guard self != nil else { return }
            guard let data = response?.data else { return }
            self?.reservationDate = data
        }
    }
}
