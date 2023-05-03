//
//  ReviewsResponse.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct ReviewsResponse: Codable {
    let reviews: [ReviewResponseData]
    let total: Int
    let possibleLanguages: [String]

    enum CodingKeys: String, CodingKey {
        case reviews, total
        case possibleLanguages = "possible_languages"
    }
}

// MARK: - Review
struct ReviewResponseData: Codable {
    let id: String
    let url: String
    let text: String
    let rating: Int
    let timeCreated: String
    let user: ReviewResponseUser

    enum CodingKeys: String, CodingKey {
        case id, url, text, rating
        case timeCreated = "time_created"
        case user
    }
}

// MARK: - User
struct ReviewResponseUser: Codable {
    let id: String
    let profileURL: String
    let imageURL: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case profileURL = "profile_url"
        case imageURL = "image_url"
        case name
    }
}
