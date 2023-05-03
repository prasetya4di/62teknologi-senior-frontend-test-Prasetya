//
//  BusinessResponse.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Foundation

struct BusinessResponse: Decodable {
    let businesses: [BusinessResponseData]
    let total: String
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
    let distance: String?
    let hours: [BusinessResponseHours]
}

struct BusinessResponseCategory: Decodable {
    let alias: String
    let title: String
}

struct BusinessResponseCoordinate: Decodable {
    let latitude: String
    let longitude: String
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
}

struct BusinessResponseHours: Decodable {
    let hourType: String
    let open: [BusinessResponseOpen]
    let isOpenNow: Bool
}

struct BusinessResponseOpen: Decodable {
    let day: Int
    let start: String
    let end: String
    let isOvernight: Bool
}

struct BusinessResponseRegion: Decodable {
    let center: BusinessResponseCenter
}

struct BusinessResponseCenter: Decodable {
    let latitude: String
    let longitude: String
}
