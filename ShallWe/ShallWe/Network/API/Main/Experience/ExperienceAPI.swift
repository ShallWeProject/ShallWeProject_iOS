//
//  ExperienceAPI.swift
//  ShallWe
//
//  Created by KJ on 2/25/24.
//

import Foundation

import Moya

final class ExperienceAPI {
    
    static let shared: ExperienceAPI = ExperienceAPI()
    
    private let experienceProvider = MoyaProvider<ExperienceTarget>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    public private(set) var sttCategoryData: GeneralResponse<[SttCategoryDto]>?
    public private(set) var expCategoryData: GeneralResponse<[ExpCategoryDto]>?
    public private(set) var popularData: GeneralResponse<[ExpGiftPopular]>?

    // MARK: - GET
    /// 상황별 카테고리 경험선물 조회
    func getSttCategory(categoryId: Int, category: String, completion: @escaping(GeneralResponse<[SttCategoryDto]>?) -> Void) {
        experienceProvider.request(.getSttCategory(categoryId: categoryId, category: category)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                if response.statusCode == 401 {
                    // 토큰
                } else {
                    do {
                        self.sttCategoryData = try response.map(GeneralResponse<[SttCategoryDto]>?.self)
                        guard let sttCategoryData = self.sttCategoryData else { return }
                        completion(sttCategoryData)
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    /// 인기별 전체 경험선물 조회
    func getExpCategory(categoryId: Int, category: String, completion: @escaping(GeneralResponse<[ExpCategoryDto]>?) -> Void) {
        experienceProvider.request(.getExpCategory(categoryId: categoryId, category: category)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                if response.statusCode == 401 {
                    // 토큰
                } else {
                    do {
                        self.expCategoryData = try response.map(GeneralResponse<[ExpCategoryDto]>?.self)
                        guard let expCategoryData = self.expCategoryData else { return }
                        completion(expCategoryData)
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    /// 인기별 전체 경험선물 조회
    func getPopularCategory(completion: @escaping(GeneralResponse<[ExpGiftPopular]>?) -> Void) {
        experienceProvider.request(.getPopular) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                if response.statusCode == 401 {
                    // 토큰
                } else {
                    do {
                        self.popularData = try response.map(GeneralResponse<[ExpGiftPopular]>?.self)
                        guard let popularData = self.popularData else { return }
                        completion(popularData)
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}
