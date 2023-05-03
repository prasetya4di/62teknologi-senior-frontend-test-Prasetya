//
//  GetBusinessDetailDetail.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol GetBusinessDetail {
    func call(id: String) async throws -> Business
}

class GetBusinessDetailImpl: GetBusinessDetail {
    private let businessRepository: BusinessRepository
    
    init(businessRepository: BusinessRepository) {
        self.businessRepository = businessRepository
    }
    
    func call(id: String) async throws -> Business {
        let response = try await businessRepository
            .getBusinessDetail(id: id)
           
        return Business(response: response)
    }
}
