//
//  HomeAPI.swift
//  ShallWe
//
//  Created by KJ on 2/9/24.
//

import Foundation

import Moya

final class HomeAPI {
    
    static let shared: HomeAPI = HomeAPI()
    
    private let homeProvider = MoyaProvider<HomeTarget>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    public private(set) var experienceGiftData: GeneralResponse<ExperienceGiftResponseDto>?
    
    // MARK: - GET
    /// 메인 페이지 조회
    func getExperienceGift(completion: @escaping(GeneralResponse<ExperienceGiftResponseDto>?) -> Void) {
        homeProvider.request(.getExperienceGift) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                if response.statusCode == 401 {
//                    TokenManager.shared.refreshNewToken { success in
//                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//                            if success {
//                                self.getExperienceGift(completion: completion)
//                            } else {
//                                completion(nil)
//                            }
//                        }
//                    }
                    print("토큰 만료")
                } else {
                    do {
                        self.experienceGiftData = try response.map(GeneralResponse<ExperienceGiftResponseDto>?.self)
                        guard let experienceGiftData = self.experienceGiftData else { return }
                        completion(experienceGiftData)
                    } catch let err {
                        print(err.localizedDescription, 500)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }

}
