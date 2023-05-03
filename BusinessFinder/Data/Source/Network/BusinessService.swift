//
//  BusinessService.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Alamofire
import CoreLocation

protocol BusinessService {
    func getBusiness(location: String, offset: Int, filter: [String: Any]) async throws -> BusinessResponse
    func getBusiness(location: CLLocation, offset: Int, filter: [String: Any]) async throws -> BusinessResponse
    func getBusinessDetail(id: String) async throws -> BusinessDetailResponse
    func getBusinessReview(id: String) async throws -> ReviewsResponse
}

class BusinessServiceImpl: BusinessService {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getBusiness(location: String, offset: Int, filter: [String: Any]) async throws -> BusinessResponse {
        var parameters: [String: Any] = [
            "location": location,
            "offset": offset
        ]
        
        parameters.merge(filter) { first, _ in
            first
        }
        
        return try await getBusinessResponse(parameters: parameters)
    }
    
    func getBusiness(location: CLLocation, offset: Int, filter: [String: Any]) async throws -> BusinessResponse {
        var parameters: [String: Any] = [
            "latitude": location.coordinate.latitude,
            "longitude": location.coordinate.longitude,
            "offset": offset
        ]
        
        parameters.merge(filter) { first, _ in
            first
        }
        
        return try await getBusinessResponse(parameters: parameters)
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
            parameters: [
                "limit": 20,
                "sort_by": "yelp_sort"
            ]
        )
    }
    
    private func getBusinessResponse(parameters: [String: Any]) async throws -> BusinessResponse {
        return try await self.networkManager.get(
            of: BusinessResponse.self,
            path: "/search",
            parameters: parameters)
    }
}
