//
//  Enums.swift
//  ShallWe
//
//  Created by 김나연 on 1/18/24.
//

import Foundation

enum FlowType: String, CaseIterable {
    case changeReservation = "예약변경"
    case accountSettings = "계정 설정"
}

protocol FAQ {
    var question: String { get }
    var answer: String { get }
    var flowType: FlowType? { get }
}

enum FAQ_Description: Int, FAQ, CaseIterable {
    case SHALLWE_SERVICE
    case WHY_GIFT_SENDER_SPECIFY_DATE
    case RESERVATION_AVAILABLE_TIMES
    case CHANGE_RESERVATION
    case CANCEL_RESERVATION
    case WITHDRAWAL_OF_CANCELLATION_REQUEST
    case HOW_TO_PAY_FOR_EXPERIENCE
    case MEMORY_PHOTO_ALBUM
    case ACCOUNT
    case OTHER_QUESTIONS

    var question: String {
        switch self {
        case .SHALLWE_SERVICE:
            return "셸위는 어떠한 서비스인가요?"
        case .WHY_GIFT_SENDER_SPECIFY_DATE:
            return "왜 선물을 보내는 사람이 날짜와 시간을 지정해야 하나요?"
        case .RESERVATION_AVAILABLE_TIMES:
            return "예약 가능한 시간이 조금밖에 안보여요."
        case .CHANGE_RESERVATION:
            return "예약을 변경하고 싶어요."
        case .CANCEL_RESERVATION:
            return "예약을 취소하고 싶어요."
        case .WITHDRAWAL_OF_CANCELLATION_REQUEST:
            return "예약 취소 요청을 철회하고 싶어요."
        case .HOW_TO_PAY_FOR_EXPERIENCE:
            return "경험 결제는 어떻게 할 수 있나요?"
        case .MEMORY_PHOTO_ALBUM:
            return "추억 사진첩은 무엇인가요?"
        case .ACCOUNT:
            return "계정을 로그아웃/탈퇴하고 싶어요."
        case .OTHER_QUESTIONS:
            return "이외에도 궁금한 점이 있어요."
        }
    }
    
    var answer: String {
        switch self {
        case .SHALLWE_SERVICE:
            return "셸위는 추억을 남길 수 있도록 돕는 경험 선물 서비스입니다. 특별한 날, 소중한 사람에게 잊지못할 추억을 선물하세요 :)"
        case .WHY_GIFT_SENDER_SPECIFY_DATE:
            return "셸위는 ‘함께하는 경험’을 소중히 생각합니다. 따라서 선물을 보내는 사람이 날짜와 시간을 지정하여 선물을 보내도록 되어 있습니다. 선물을 받는 사람이 예약된 날짜와 시간을 변경할 수도 있으니, 만약 함께하는 경험이 아니라면 아무 날짜나 임의 지정하여 선물을 보내주세요!"
        case .RESERVATION_AVAILABLE_TIMES:
            return "실시간 예약 현황에 따라 예약이 마감된 일시는 자동적으로 표시되지 않습니다. 예약 가능한 다른 일시를 선택해주세요."
        case .CHANGE_RESERVATION:
            return "예약 변경은 이용일로부터 3일 전까지만 가능합니다. 마이페이지 > 보낸 선물함에서 예약변경을 클릭하여 원하시는 일시로 예약을 변경해주세요."
        case .CANCEL_RESERVATION:
            return "예약 취소는 이용일로부터 7일 전까지만 가능합니다. 이후 예약을 취소하실 경우, 작가님께 개인적으로 연락해주세요. 취소 일시에 따라 별도의 수수료가 부과될 수 있다는 점 참고 부탁드립니다."
        case .WITHDRAWAL_OF_CANCELLATION_REQUEST:
            return "예약 취소 요청 철회는 시스템 상 불가능합니다. 예약 절차를 다시 진행해주세요."
        case .HOW_TO_PAY_FOR_EXPERIENCE:
            return "예약을 완료하시면 작가님께 예약자님의 예약 정보가 전달됩니다. 작가님들께서 안내해주시는 절차에 따라 결제를 진행해주세요. 결제를 완료하셔야 예약이 확정됩니다."
        case .MEMORY_PHOTO_ALBUM:
            return "추억 사진첩은 소중한 사람들과 함께한 추억을 업로드할 수 있는 사진첩입니다. 경험별로 추억을 업로드해보세요!"
        case .ACCOUNT:
            return "셸위를 떠나신다니 아쉽군요. 계정 로그아웃과 탈퇴는 계정 설정에서 진행할 수 있습니다. 다시 만날 수 있길 바라요."
        case .OTHER_QUESTIONS:
            return "기타 문의사항은 connect.shallwe@gmail.com으로 전달 부탁드립니다."
        }
    }
    
    var flowType: FlowType? {
        switch self {
        case .CHANGE_RESERVATION:
            return FlowType.changeReservation
        case .ACCOUNT:
            return FlowType.accountSettings
        default:
            return nil
        }
    }
}

enum ReasonForWithdrawal: Int, CaseIterable {
    case NOT_USED_OFTEN
    case DUPLICATE_ACCOUNT
    case APP_ERROR
    case EXPENSIVE
    case FEW_PRODUCT_TYPES
    case INCONVENIENT_TO_USE
    case OTHER_REASONS
    
    func getDescription() -> String {
        switch self {
        case .NOT_USED_OFTEN:
            return "자주 사용하지 않아요."
        case .DUPLICATE_ACCOUNT:
            return "중복 계정이 있어요."
        case .APP_ERROR:
            return "앱 오류가 있어요."
        case .EXPENSIVE:
            return "타사 대비 가격이 비싸요."
        case .FEW_PRODUCT_TYPES:
            return "상품(경험) 종류가 적어요."
        case .INCONVENIENT_TO_USE:
            return "사용성/화면 디자인이 불편해요."
        case .OTHER_REASONS:
            return "기타 사유가 있어요."
        }
    }
}

enum InfoDeleted: String, CaseIterable {
    case ACCOUNT = "계정 및 프로필 정보 삭제"
    case MY_RESERVATION_INFO = "내 예약 정보 삭제"
    case CASH = "캐시 삭제"
    case MEMORY_PHOTO_ALBUM = "추억사진첩 사진 삭제"
}
