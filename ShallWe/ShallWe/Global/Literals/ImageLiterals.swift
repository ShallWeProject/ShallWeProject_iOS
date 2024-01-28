//
//  ImageLiterals.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import UIKit

enum ImageLiterals {
    
    enum TabBar {
        static var category: UIImage { .load(name: "category") }
        static var category_selected: UIImage { .load(name: "categorySelected") }
        static var home: UIImage { .load(name: "home") }
        static var home_selected: UIImage { .load(name: "homeSelected") }
        static var mypage: UIImage { .load(name: "mypage") }
        static var mypage_selected: UIImage { .load(name: "mypageSelected") }
    }
    
    enum Icon {
        static var alert: UIImage { .load(name: "ic_alert") }
        static var arrow_down_small: UIImage { .load(name: "ic_arrow_down_small") }
        static var arrow_down: UIImage { .load(name: "ic_arrow_down") }
        static var arrow_left: UIImage { .load(name: "ic_arrow_left") }
        static var arrow_up: UIImage { .load(name: "ic_arrow_up") }
        static var book: UIImage { .load(name: "ic_book") }
        static var check_activated: UIImage { .load(name: "ic_check_activated") }
        static var check_default: UIImage { .load(name: "ic_check_default") }
        static var check_round_activated: UIImage { .load(name: "ic_check_round_activated") }
        static var check_round_default: UIImage { .load(name: "ic_check_round_default") }
        static var delete: UIImage { .load(name: "ic_delete") }
        static var gift: UIImage { .load(name: "ic_gift") }
        static var left_calender_1: UIImage { .load(name: "ic_left_calender-1") }
        static var left_calender: UIImage { .load(name: "ic_left_calender") }
        static var minus: UIImage { .load(name: "ic_minus") }
        static var plus_circle: UIImage { .load(name: "ic_plus_circle") }
        static var plus: UIImage { .load(name: "ic_plus") }
        static var right_calender_1: UIImage { .load(name: "ic_right_calender-1") }
        static var right_calender: UIImage { .load(name: "ic_right_calender") }
        static var search_colored: UIImage { .load(name: "ic_search_colored") }
        static var search: UIImage { .load(name: "ic_search") }
    }
    
    enum Home {
        static var logo_shallwe: UIImage { .load(name: "logo_shallwe") }
        static var img_birthday: UIImage { .load(name: "img_birthday") }
        static var img_grade: UIImage { .load(name: "img_grade") }
        static var img_lover: UIImage { .load(name: "img_lover") }
        static var img_marriage: UIImage { .load(name: "img_marriage") }
        static var img_parents: UIImage { .load(name: "img_parents") }
        static var img_ad1: UIImage { .load(name: "ad1") }
        static var img_ad2: UIImage { .load(name: "ad2") }
    }
    
    enum Category {
        static var ic_album: UIImage { .load(name: "ic_album") }
        static var ic_baking: UIImage { .load(name: "ic_baking") }
        static var ic_craft: UIImage { .load(name: "ic_craft") }
        static var ic_culture: UIImage { .load(name: "ic_culture") }
        static var ic_faq: UIImage { .load(name: "ic_faq") }
        static var ic_getGift: UIImage { .load(name: "ic_getGift") }
        static var ic_mail: UIImage { .load(name: "ic_mail") }
        static var ic_outdoor: UIImage { .load(name: "ic_outdoor") }
        static var ic_sendGift: UIImage { .load(name: "ic_sendGift") }
        static var ic_sport: UIImage { .load(name: "ic_sport") }
    }
    
    enum Auth {
        static var logo_shallWe_big: UIImage { .load(name: "shallWeLogo") }
        static var ic_kakao_login: UIImage { .load(name: "kakaoLoginIcon") }
        static var img_firework: UIImage { .load(name: "firework") }
    }
    
    enum ExperienceLetter {
        static var img_letter: UIImage { .load(name: "letter") }
    }
    
    enum FAQ {
        static var img_faq: UIImage { .load(name: "faq") }
        static var logo_shallWe_small: UIImage { .load(name: "shallWeLogo_small") }
    }
}
