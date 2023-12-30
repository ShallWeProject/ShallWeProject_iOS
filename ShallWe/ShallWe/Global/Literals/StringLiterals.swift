//
//  StringLiterals.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import Foundation

enum I18N {
    
    enum Common {
        static let appTitle = "Shall We"
    }
    
    enum ExperienceDetail {
        static let segementTitle1 = "설명"
        static let segementTitle2 = "안내"
        static let giftButton = "선물하기"
        static let tableViewTitle = "커리큘럼"
        static let addressTitle = "오시는 길"
        static let noteTitle = "신청 시 유의사항"
        static let changeTitle = "예약 변경"
        static let cancelTitle = "예약 취소"
    }

    enum Auth {
        static let mainIntroText = "경험을 선물하는 서비스 셸위"
        static let subIntroText = "소중한 사람들과 잊지 못할 추억을 만들어보세요"
        static let kakaoLoginText = "카카오 로그인"
        static let appleLoginText = "Apple로 로그인"
        static let phoneNumberVerificationText = "원활한 서비스 이용을 위해\n전화번호를 인증해주세요"
        static let agreementToTermsText = "추억을 만들기 위해서는\n약관 동의가 필요해요"
        static let recommendationText = "딱 맞는 경험만 추천해 보여드릴게요"
        static let nameInputText = "이름을 입력해주세요"
        static let phoneNumberInputText = "전화번호를 입력해주세요"
        static let verificationCodeInputText = "인증번호를 입력해주세요"
        static let verificationRequestText = "인증 요청"
        static let verificationSuccessText = "인증 완료"
        static let checkText = "인증번호 확인"
        static let nextText = "다음"
        static let loginCompletionText = "로그인 완료!"
        static let signupCompletionText = "회원가입 완료!"
        static let serviceAvailableText = "지금 바로 셸위의 다양한 서비스를\n이용하실 수 있습니다"
        static let goHomeText = "홈으로"
        static let ageInputText = "나이를 입력해주세요"
        static let ageUnitText = "세"
        static let genderSelectionText = "성별을 선택해주세요"
        static let maleText = "남성"
        static let femaleText = "여성"
        static let noneText = "선택안함"
        static let totallyAgreeText = "전체 동의"
        static let age14OrOlderText = "만 14세 이상입니다"
        static let agreeToTermsOfServiceText = "서비스 이용약관 동의"
        static let agreeToCollectionAndUsePersonalInfoText = "개인정보 수집 및 이용 동의"
        static let agreeToReceiveMarketingInfoText = "마케팅 정보 수신 동의"
        static let requiredText = "필수"
        static let optionalText = "선택"
        static let seeDetailText = "내용보기"
        static let closeText = "닫기"
    }
    
    enum Home {
        static let searchTitle = "찾고있는 경험이 있나요?"
        static let headerTitle1 = "상황별 추천 경험"
        static let headerTitle1Color = "상황별"
        static let headerTitle2 = "실시간 인기 경험"
        static let headerTitle2Color = "인기"
    }
    
    enum AuthAlert {
        static let codeSentText = "인증번호가 전송되었습니다."
        static let verifiedText = "인증되었습니다."
        static let incorrectCodeText = "인증번호가 일치하지 않습니다. 다시 시도해주세요."
        static let timeoutText = "인증 시간이 초과되었습니다. 다시 시도해주세요."
    }
}
