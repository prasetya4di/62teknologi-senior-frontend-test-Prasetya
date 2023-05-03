//
//  BusinessResponse.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Foundation

struct BusinessResponse: Decodable {
    let businesses: [BusinessResponseData]
    let total: Int
    let region: BusinessResponseRegion
}

struct BusinessResponseData: Decodable {
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
    }
}

struct BusinessResponseCategory: Decodable {
    let alias: String
    let title: String
}

struct BusinessResponseCoordinate: Decodable {
    let latitude: Double
    let longitude: Double
}

struct BusinessResponseLocation: Decodable {
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String?
    let zipCode: String?
    let country: String?
    let state: String?
    let displayAddress: [String]
    let crossStreets: String?
    
    enum CodingKeys: String, CodingKey {
        case address1
        case address2
        case address3
        case city
        case zipCode = "zip_code"
        case country
        case state
        case displayAddress = "display_address"
        case crossStreets = "cross_streets"
    }
}

struct BusinessResponseHours: Decodable {
    let hourType: String
    let open: [BusinessResponseOpen]
    let isOpenNow: Bool
    
    enum CodingKeys: String, CodingKey {
        case hourType = "hour_type"
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

struct BusinessResponseRegion: Decodable {
    let center: BusinessResponseCenter
}

struct BusinessResponseCenter: Decodable {
    let latitude: Double
    let longitude: Double
}
