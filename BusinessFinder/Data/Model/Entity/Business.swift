//
//  Business.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import MapKit

struct Business {
    let id: String
    let alias: String
    let name: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    let categories: [BusinessCategory]
    let rating: Int
    private let coordinates: BusinessCoordinate
    let transactions: [String]
    let price: String?
    let location: BusinessLocation
    let phone: String
    let displayPhone: String
    let distance: String?
    let hours: [BusinessHours]
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: Double(coordinates.latitude)!,
            longitude: Double(coordinates.longitude)!
        )
    }
    
    init(response: BusinessResponseData) {
        id = response.id
        alias = response.alias
        name = response.name
        imageUrl = response.imageUrl
        isClosed = response.isClosed
        url = response.url
        reviewCount = response.reviewCount
        categories = response.categories.map { BusinessCategory(response: $0) }
        rating = response.rating
        coordinates = BusinessCoordinate(response: response.coordinates)
        transactions = response.transactions
        price = response.price
        location = BusinessLocation(response: response.location)
        phone = response.phone
        displayPhone = response.displayPhone
        distance = response.distance
        hours = response.hours.map { BusinessHours(response: $0) }
        
    }
}
