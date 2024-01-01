//
//  RecommendModel.swift
//  ShallWe
//
//  Created by KJ on 12/3/23.
//

import UIKit

struct RecommendModel {
    let image: UIImage
}

extension RecommendModel {
    
    static func recommendCategoryData() -> [RecommendModel] {
        return [
            RecommendModel(image: ImageLiterals.Home.img_birthday),
            RecommendModel(image: ImageLiterals.Home.img_lover),
            RecommendModel(image: ImageLiterals.Home.img_parents),
            RecommendModel(image: ImageLiterals.Home.img_grade),
            RecommendModel(image: ImageLiterals.Home.img_marriage)
        ]
    }
}
