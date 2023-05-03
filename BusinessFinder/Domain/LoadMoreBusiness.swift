//
//  LoadMoreBusiness.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol LoadMoreBusiness {
    func call(location: String, offset: Int, filter: [String: Any]) async throws -> [Business]
}

class LoadMoreBusinessImpl: LoadMoreBusiness {
    private let businessRepository: BusinessRepository
    
    init(businessRepository: BusinessRepository) {
        self.businessRepository = businessRepository
    }
    
    func call(location: String, offset: Int, filter: [String: Any]) async throws -> [Business] {
        try await businessRepository
            .getBusiness(
                location: location,
                offset: offset,
                filter: filter
            )
            .businesses
            .map { Business(response: $0)}
    }
}
