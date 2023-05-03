//
//  BusinessRepository.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Alamofire
import CoreLocation

protocol BusinessRepository {
    func getBusiness(location: String, offset: Int, filter: [String: Any]) async throws -> BusinessResponse
    func getBusiness(location: CLLocation, offset: Int, filter: [String: Any]) async throws -> BusinessResponse
    func getBusinessDetail(id: String) async throws -> BusinessDetailResponse
    func getBusinessReview(id: String) async throws -> ReviewsResponse
}

class BusinessRepositoryImpl: BusinessRepository {
    private let businessService: BusinessService
    
    init(businessService: BusinessService) {
        self.businessService = businessService
    }
    
    func getBusiness(location: String, offset: Int, filter: [String: Any]) async throws -> BusinessResponse {
        try await businessService.getBusiness(location: location, offset: offset, filter: filter)
    }
    
    func getBusiness(location: CLLocation, offset: Int, filter: [String: Any]) async throws -> BusinessResponse {
        try await businessService.getBusiness(location: location, offset: offset, filter: filter)
    }
    
    func getBusinessDetail(id: String) async throws -> BusinessDetailResponse {
        try await businessService.getBusinessDetail(id: id)
    }
    
    func getBusinessReview(id: String) async throws -> ReviewsResponse {
        try await businessService.getBusinessReview(id: id)
    }
}
