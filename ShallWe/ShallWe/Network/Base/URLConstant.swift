//
//  URLConstant.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import Foundation

enum URLConstant {
    
    // MARK: - Base URL
    
    static let baseURL = Config.baseURL
    
    // MARK: - URL Path
    
    // Reservations

    static let reservation = "/api/v1/reservations"
    static let reservationUser = "/api/v1/reservations/user"
    static let reservationValidTime = "/api/v1/reservations/validTimes"
    static let reservationGiftID = "/api/v1/reservations/giftId"
    static let reservationDate = "/api/v1/reservations/date"
    
    // MemoryPhotos
    
    static let memoryPhoto = "/api/v1/memory-photo"
    
    // Authorization
    
    static let shopOwnerChangePassword = "/auth/shop-owner/change-password"
    static let ValidVerificationCode = "/auth/valid-verification-code"
    static let signUp = "/auth/sign-up"
    static let signOut = "/auth/sign-out"
    static let signIn = "/auth/sign-in"
    static let sendOne = "/auth/send-one"
    static let refreshToken = "/auth/refresh"
    
    // ExperienceGifts
    
    static let experienceGift = "/api/v1/experience/gift"
    static let experienceGiftSttCategory = "/api/v1/experience/gift/stt-category/{SttCategoryId}"
    static let experienceGiftSearch = "/api/v1/experience/gift/search"
    static let experienceGiftPopular = "/api/v1/experience/gift/popular"
    static let experienceExpCategory = "/api/v1/experience/gift/exp-category/{ExpCategoryId}"
    static let experienceDetails = "/api/v1/experience/gift/details/{ExperienceGiftId}"
    
    // Users
    
    static let user = "/api/v1/users"
    static let userGiftSend = "/api/v1/users/gift/send"
    static let userGiftReceive = "/api/v1/users/gift/receive"
    static let userInactive = "/api/v1/users/inactive"
    static let bearer = "Bearer "
}
