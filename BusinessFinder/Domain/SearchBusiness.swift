//
//  SearchBusiness.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol SearchBusiness {
    func call(location: String, term: String) async throws -> [Business]
}

class SearchBusinessImpl: SearchBusiness {
    private let repository: BusinessRepository
    
    init(repository: BusinessRepository) {
        self.repository = repository
    }
    
    func call(location: String, term: String) async throws -> [Business] {
        try await repository
            .getBusiness(location: location, term: term)
            .businesses
            .map { Business(response: $0) }
    }
}
