//
//  ExperienceGiftViewModel.swift
//  ShallWe
//
//  Created by 고아라 on 2/15/24.
//

import UIKit

import RxSwift
import RxCocoa

protocol ExperienceGiftViewModelInputs {
    func reservationDate(giftId: Int, date: String)
    func giftMemberInfo(member: Int)
    func giftTimeInfo(time: String)
    func giftPhoneInfo(phone: String)
    func giftLetterInfo(letter: String)
    func reservationUserData()
}

protocol ExperienceGiftViewModelOutputs {
    var reservationDate: [ReservationDateResponseDto]? { get }
    var reservationUser: BehaviorRelay<ReservationUserResponseDto> { get }
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
    
    // properties
    
    private var selectGiftId: Int = 0
    private var selectMember: Int = 0
    private var selectDate: String = ""
    private var selectTime: String = ""
    private var phone: String = ""
    private var letter: String = ""
    
    // output
    
    var reservationDate: [ReservationDateResponseDto]? {
        didSet {
            experienceGiftObservable.emit(reservationDate)
        }
    }
    
    var reservationUser: BehaviorRelay<ReservationUserResponseDto> = BehaviorRelay<ReservationUserResponseDto>(value: ReservationUserResponseDto.reservationUserInitValue())
    
    func observeExperienceGift(_ observer: @escaping ExperienceGiftObservable<[ReservationDateResponseDto]?>.Observer) {
        experienceGiftObservable.observe(observer: observer)
    }
    
    var inputs: ExperienceGiftViewModelInputs { return self }
    var outputs: ExperienceGiftViewModelOutputs { return self }
    
    init(){
        self.reservationDate(giftId: 1, date: "2024-02-08")
    }
    
    // input
    
    func reservationDate(giftId: Int, date: String) {
        self.selectGiftId = giftId
        self.selectDate = date
        self.getReservationDate(giftId: giftId, date: date)
    }
    
    func giftMemberInfo(member: Int) {
        self.selectMember = member
    }
    
    func giftTimeInfo(time: String) {
        self.selectTime = "\(time):00:00"
    }
    
    func giftPhoneInfo(phone: String) {
        self.phone = phone
    }
    
    func giftLetterInfo(letter: String) {
        self.letter = letter
    }
    
    func reservationUserData() {
        self.postReservationUser()
    }
}

extension ExperienceGiftViewModel {
    
    func getReservationDate(giftId: Int,  date: String) {
        ExperienceAPI.shared.getReservationDate(giftId: giftId, date: date) { [weak self] response in
            guard (response?.statusCode) != nil else { return }
            guard self != nil else { return }
            guard let data = response?.data else { return }
            self?.reservationDate = data
        }
    }
    
    func postReservationUser() {
        let model: ReservationUserRequestDto = ReservationUserRequestDto(experienceGiftID: 17, persons: selectMember, date: "2024-02-21", time: "04:00:00", phoneNumber: phone, imageURL: "", invitationComment: letter)
        ExperienceAPI.shared.postReservationUser(param: model) { [weak self] response in
            guard let statusCode = response?.statusCode else { return }
            guard self != nil else { return }
            guard let data = response?.data else { return }
            self?.reservationUser.accept(data)
        }
    }
}
