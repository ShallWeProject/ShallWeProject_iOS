//
//  SortModel.swift
//  ShallWe
//
//  Created by KJ on 1/21/24.
//

import Foundation

struct SortModel {
    let title: String
}

extension SortModel {
    
    static func sortData() -> [SortModel] {
        return [
            SortModel(title: "인기순"),
            SortModel(title: "추천순"),
            SortModel(title: "가격높은순"),
            SortModel(title: "가격낮은순")
        ]
    }
}
