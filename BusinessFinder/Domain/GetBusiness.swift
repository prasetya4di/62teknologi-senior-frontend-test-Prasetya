//
//  GetBusiness.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Foundation
import Combine

protocol GetBusiness {
    func call() async throws -> [Business]
}

class GetBusinessImpl: GetBusiness {
    private let businessRepository: BusinessRepository
    
    init(businessRepository: BusinessRepository) {
        self.businessRepository = businessRepository
    }
    
    func call() async throws -> [Business] {
        try await businessRepository
            .getBusiness(
                location: Locale.current.language.region?.identifier ?? "ID",
                offset: 0
            )
            .businesses.map { response in
                Business(response: response)
            }
    }
}
