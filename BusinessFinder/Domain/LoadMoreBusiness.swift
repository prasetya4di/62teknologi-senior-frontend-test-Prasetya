//
//  LoadMoreBusiness.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol LoadMoreBusiness {
    func call(location: String, offset: Int, term: String) async throws -> [Business]
}

class LoadMoreBusinessImpl: LoadMoreBusiness {
    private let businessRepository: BusinessRepository
    
    init(businessRepository: BusinessRepository) {
        self.businessRepository = businessRepository
    }
    
    func call(location: String, offset: Int, term: String) async throws -> [Business] {
        try await getBusiness(location: location, offset: offset, term: term)
            .businesses
            .map { Business(response: $0)}
    }
    
    private func getBusiness(
        location: String,
        offset: Int,
        term: String
    ) async throws -> BusinessResponse {
        if term.isEmpty {
            return try await businessRepository
                .getBusiness(
                    location: location,
                    offset: offset)
        } else {
            return try await businessRepository
                .getBusiness(
                    location: location,
                    offset: offset,
                    term: term
                )
        }
    }
}
