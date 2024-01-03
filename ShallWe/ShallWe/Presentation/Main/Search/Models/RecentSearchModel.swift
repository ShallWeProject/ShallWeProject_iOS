//
//  RecentSearchModel.swift
//  ShallWe
//
//  Created by KJ on 1/3/24.
//

import Foundation

struct RecentSearchModel {
    var title: String
}

extension RecentSearchModel {
    
    static func recentSearchDummy() -> [RecentSearchModel] {
        return [
            RecentSearchModel(title: "케이크"),
            RecentSearchModel(title: "터프팅"),
            RecentSearchModel(title: "서울 글램핑")
        ]
    }
}
