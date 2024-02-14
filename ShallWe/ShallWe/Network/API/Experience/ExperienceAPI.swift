//
//  ExperienceAPI.swift
//  ShallWe
//
//  Created by 고아라 on 2/10/24.
//

import Foundation

import Moya

final class ExperienceAPI {
    
    static let shared: ExperienceAPI = ExperienceAPI()
    
    private let experienceProvider = MoyaProvider<ExperienceTarget>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    public private(set) var experienceDetailData: GeneralResponse<ExperienceDetailResponseDto>?
    
    func getExperienceDetail(giftId: Int,
                             completion: @escaping(GeneralResponse<ExperienceDetailResponseDto>?) -> Void) {
        experienceProvider.request(.getExperienceDetail(experienceGiftId: giftId)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.experienceDetailData = try response.map(GeneralResponse<ExperienceDetailResponseDto>?.self)
                    guard let experienceDetailData = self.experienceDetailData else { return }
                    completion(experienceDetailData)
                } catch let err {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}