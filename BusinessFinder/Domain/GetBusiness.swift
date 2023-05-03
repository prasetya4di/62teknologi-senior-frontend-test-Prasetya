//
//  GetBusiness.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Foundation
import Combine

protocol GetBusiness {
    func call(location: String, offset: Int, filter: [String: Any]) async throws -> [Business]
}

class GetBusinessImpl: GetBusiness {
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
            .businesses.map { response in
                Business(response: response)
            }
    }
}
