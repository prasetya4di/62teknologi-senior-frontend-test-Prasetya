//
//  BusinessService.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Alamofire

protocol BusinessService {
    func getBusiness(location: String) async throws -> BusinessResponse
    func getBusinessDetail(id: String) async throws -> BusinessDetailResponse
    func getBusinessReview(id: String) async throws -> ReviewsResponse
}

class BusinessServiceImpl: BusinessService {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getBusiness(location: String) async throws -> BusinessResponse {
        try await self.networkManager.get(
            of: BusinessResponse.self,
            path: "/search",
            parameters: [
                "location": location
            ])
    }
    
    func getBusinessDetail(id: String) async throws -> BusinessDetailResponse {
        try await self.networkManager.get(
            of: BusinessDetailResponse.self,
            path: "/\(id)",
            parameters: nil
        )
    }
    
    func getBusinessReview(id: String) async throws -> ReviewsResponse {
        try await self.networkManager.get(
            of: ReviewsResponse.self,
            path: "/\(id)/reviews",
            parameters: nil
        )
    }
}
