//
//  GetBusinessReviews.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol GetBusinessReviews {
    func call(id: String) async throws -> [Review]
}

class GetBusinessReviewsImpl: GetBusinessReviews {
    private let businessRepository: BusinessRepository
    
    init(businessRepository: BusinessRepository) {
        self.businessRepository = businessRepository
    }
    
    func call(id: String) async throws -> [Review] {
        try await businessRepository
            .getBusinessReview(id: id)
            .reviews.map { response in
                Review(response: response)
            }
    }
}
