//
//  HomeExperienceModel.swift
//  ShallWe
//
//  Created by KJ on 12/6/23.
//

import UIKit

struct HomeExperienceModel {
    let image: UIImage
    let title: String
    let description: String
    let price: String
}

extension HomeExperienceModel {
    
    static func homeExperienceDummyData() -> [HomeExperienceModel] {
        return [
            HomeExperienceModel(image: ImageLiterals.Home.img_ad2, title: "[성수] 인기 공예 클래스", description: "프라이빗 소수정예 터프팅 클래스", price: "39,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[망원] 인기 베이킹 클래스", description: "체리 갈레트 비건 글루텐프리 쌀 베이킹 클래스", price: "30,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[송파] 인기 공예 클래스", description: "2SET 물레 체험, 도자기 그릇 접시 만들기 원데이클래스", price: "49,700 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad2, title: "[성수] 인기 공예 클래스", description: "프라이빗 소수정예 터프팅 클래스", price: "39,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[망원] 인기 베이킹 클래스", description: "체리 갈레트 비건 글루텐프리 쌀 베이킹 클래스", price: "30,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[송파] 인기 공예 클래스", description: "2SET 물레 체험, 도자기 그릇 접시 만들기 원데이클래스", price: "49,700 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad2, title: "[성수] 인기 공예 클래스", description: "프라이빗 소수정예 터프팅 클래스", price: "39,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[망원] 인기 베이킹 클래스", description: "체리 갈레트 비건 글루텐프리 쌀 베이킹 클래스", price: "30,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[송파] 인기 공예 클래스", description: "2SET 물레 체험, 도자기 그릇 접시 만들기 원데이클래스", price: "49,700 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad2, title: "[성수] 인기 공예 클래스", description: "프라이빗 소수정예 터프팅 클래스", price: "39,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[망원] 인기 베이킹 클래스", description: "체리 갈레트 비건 글루텐프리 쌀 베이킹 클래스", price: "30,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[송파] 인기 공예 클래스", description: "2SET 물레 체험, 도자기 그릇 접시 만들기 원데이클래스", price: "49,700 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad2, title: "[성수] 인기 공예 클래스", description: "프라이빗 소수정예 터프팅 클래스", price: "39,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[망원] 인기 베이킹 클래스", description: "체리 갈레트 비건 글루텐프리 쌀 베이킹 클래스", price: "30,800 원"),
            HomeExperienceModel(image: ImageLiterals.Home.img_ad1, title: "[송파] 인기 공예 클래스", description: "2SET 물레 체험, 도자기 그릇 접시 만들기 원데이클래스", price: "49,700 원")
        ]
    }
}
