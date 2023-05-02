//
//  Business.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

struct Business {
    let id: String
    let alias: String
    let name: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let reviewCount: String
    let categories: [BusinessCategory]
    let rating: String
    let coordinates: BusinessCoordinate
    let transactions: [String]
    let price: String?
    let location: BusinessLocation
    let phone: String
    let displayPhone: String
    let distance: String?
    let hours: [BusinessHours]
}
