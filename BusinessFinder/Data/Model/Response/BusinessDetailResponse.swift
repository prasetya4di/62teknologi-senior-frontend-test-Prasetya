//
//  BusinessDetailResponse.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct BusinessDetailResponse: Decodable {
    let id: String
    let alias: String
    let name: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    let categories: [BusinessResponseCategory]
    let rating: Double
    let coordinates: BusinessResponseCoordinate
    let transactions: [String]
    let price: String?
    let location: BusinessResponseLocation
    let phone: String
    let displayPhone: String
    let distance: Double?
    let photos: [String]
    let hours: [BusinessResponseHours]
    
    enum CodingKeys: String, CodingKey {
        case id
        case alias
        case name
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case displayPhone = "display_phone"
        case distance
        case photos
        case hours
    }
}

struct BusinessResponseHours: Decodable {
    let hourType: String
    let open: [BusinessResponseOpen]
    let isOpenNow: Bool
    
    enum CodingKeys: String, CodingKey {
        case hourType = "hours_type"
        case open
        case isOpenNow = "is_open_now"
    }
}

struct BusinessResponseOpen: Decodable {
    let day: Int
    let start: String
    let end: String
    let isOvernight: Bool
    
    enum CodingKeys: String, CodingKey {
        case day
        case start
        case end
        case isOvernight = "is_overnight"
    }
}
