//
//  PopularCategoryModel.swift
//  ShallWe
//
//  Created by KJ on 12/3/23.
//

import UIKit

struct PopularCategoryModel {
    let title: String
}

extension PopularCategoryModel {
    
    static func popularCategoryTitleData() -> [PopularCategoryModel] {
        return [
            PopularCategoryModel(title: "전체"),
            PopularCategoryModel(title: "공예"),
            PopularCategoryModel(title: "베이킹"),
            PopularCategoryModel(title: "문화예술"),
            PopularCategoryModel(title: "아웃도어"),
            PopularCategoryModel(title: "스포츠"),
            PopularCategoryModel(title: "컨설팅"),
            PopularCategoryModel(title: "기타")
        ]
    }
}
