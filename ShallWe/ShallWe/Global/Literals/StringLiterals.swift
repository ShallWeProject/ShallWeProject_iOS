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
        static let age14OrOlderText = "만 14세 이상입니다 [필수]"
        static let agreeToTermsOfServiceText = "서비스 이용약관 동의 [필수]"
        static let agreeToCollectionAndUsePersonalInfoText = "개인정보 수집 및 이용 동의 [필수]"
        static let agreeToReceiveMarketingInfoText = "마케팅 정보 수신 동의 [선택]"
        static let viewDetailsText = "내용보기"
        static let requiredText = "[필수]"
        static let closeText = "닫기"
    }
    
    enum Home {
        static let searchTitle = "찾고있는 경험이 있나요?"
        static let headerTitle1 = "상황별 추천 경험"
        static let headerTitle1Color = "상황별"
        static let headerTitle2 = "실시간 인기 경험"
        static let headerTitle2Color = "인기"
    }
    
    enum HomeExperience {
        static let birth = "생일"
        static let lover = "연인"
        static let parents = "부모님"
        static let graduate = "입학/졸업"
        static let marriage = "결혼/집들이"
        static let all = "전체"
        static let craft = "공예"
        static let baking = "베이킹"
        static let culture = "문화예술"
        static let outdoor = "아웃도어"
        static let sport = "스포츠"
        static let consulting = "컨설팅"
        static let other = "기타"
    }
    
    enum Search {
        static let notRecentSearch = "최근 검색어 내역이 없습니다."
        static let notSearchResult = "에 대한 검색결과가 없습니다."
        static let cancel = "취소"
        static let recentSearch = "최근 검색어"
        static let deleteAll = "전체 삭제"
    }
    
    enum Category {
        static let experienceCategory = "경험 카테고리"
        static let myPage = "마이페이지"
        static let customerService = "고객 센터"
    }
    
    enum AuthAlert {
        static let codeSentText = "인증번호가 전송되었습니다."
        static let verifiedText = "인증되었습니다."
        static let incorrectCodeText = "인증번호가 일치하지 않습니다. 다시 시도해주세요."
        static let timeoutText = "인증 시간이 초과되었습니다. 다시 시도해주세요."
    }
    
    enum ExperienceGift {
        static let experienceGiftTitle = "경험 선택"
        static let personTitle = "인원 수"
        static let reservationTitle = "예약 일시"
        static let navigationTitle = "경험 선물 페이지"
        static let fromMypageNavigationTitle = "예약 변경 페이지"
        static let fromMypageButtonTitle = "변경하기"
        static let alertLeftTitle = "취소"
        static let alertRightTitle = "변경하기"
    }
    
    enum ExperienceLetter {
        static let senderTitle = "보내는 분"
        static let recipientTitle = "받는 분"
        static let inviteTitle = "초대장"
        static let namePlaceholder = "이름을 입력해주세요."
        static let phoneFirstTitle = "010"
        static let infoTitle = "받는 분의 정보를 정확하게 기입 부탁드립니다.\n타인에게 전송될 시, 셸위에게는 책임 소지가 없음을 알려드립니다."
    }
    
    enum FAQ {
        static let Q = "Q."
        static let A = "A."
        static let accountManagementText = "계정 관리"
        static let logoutText = "로그아웃"
        static let withdrawalText = "회원 탈퇴"
        static let logoutAlertText = "현재 계정에서\n로그아웃 하시겠습니까?"
        static let cautionText = "주의해 주세요!"
        static let checkWhatInfoisDeletedText = "탈퇴 시 삭제/유지되는 정보를 확인해 주세요.\n한 번 삭제된 정보는 복구가 불가능합니다."
        static let whatMadeYouUncomfortableText = "무엇이 불편하셨나요?"
        static let selectReasonText = "탈퇴하시는 이유를 선택해주세요."
        static let withdrawText = "회원 탈퇴하기"
        static let thanksText = "그동안 셸위와\n함께해 주셔서 감사합니다."
    }
  
    enum Complete {
        static let titleLabel = "예약 변경 성공"
        static let subTitleLabel = "예약 변경이\n정상적으로 완료되었습니다!"
        static let fromExperienceTitleLabel = "보내드린 문자를 확인하여\n결제를 완료해주세요!"
        static let fromExperienceSubTitleLabel = "결제가 확인되면\n따뜻한 마음을 담아 초대장을 발송해드려요."
    }
    
    enum Mypage {
        static let albumTitle = "추억사진첩"
        static let cancelTitle = "예약을 취소하시겠습니까?"
        static let cancelMessage = "24시간 내로 작가님께서 환불 절차 관련 문자를 발송하여 주실 예정입니다. 문자로 안내드리는 절차에 따라 환불 절차 진행 부탁드립니다."
        static let alertLeftTitle = "아니오"
        static let alertRightTitle = "예약 취소"
        static let alertCancelTitle = "예약이 취소되었습니다."
    }
    
    enum MemoryPhotoAlbum {
        static let memoryText = " 의 추억"
        static let deleteText = "사진 삭제"
        static let closeText = "닫기"
        static let noMemoryText = "셸위와 함께한 추억이 아직 없네요 ..."
    }
}
