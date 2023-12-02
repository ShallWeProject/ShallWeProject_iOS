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
        static var eft_calender_1: UIImage { .load(name: "ic_left_calender-1") }
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
    }
}
