//
//  BusinessRepository.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Alamofire

protocol BusinessRepository {
    func getBusiness(location: String) async throws -> BusinessResponse
}

class BusinessRepositoryImpl: BusinessRepository {
    private let businessService: BusinessService
    
    init(businessService: BusinessService) {
        self.businessService = businessService
    }
    
    func getBusiness(location: String) async throws -> BusinessResponse {
        businessService.getBusiness(location: location)
    }
}
