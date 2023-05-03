//
//  Business.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import MapKit

struct Business: Equatable {
    let id: String
    let alias: String
    let name: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    private let categories: [BusinessCategory]
    let rating: Double
    private let coordinates: BusinessCoordinate
    let transactions: [String]
    let price: String?
    let location: BusinessLocation
    let phone: String
    let displayPhone: String
    let distance: Double?
    
    var categoriesName: [String] {
        categories.map { $0.title }
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
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
    }
    
    init(
        id: String,
        alias: String,
        name: String,
        imageUrl: String,
        isClosed: Bool,
        url: String,
        reviewCount: Int,
        categories: [BusinessCategory],
        rating: Double,
        coordinates: BusinessCoordinate,
        transactions: [String],
        price: String?,
        location: BusinessLocation,
        phone: String,
        displayPhone: String,
        distance: Double?) {
            self.id = id
            self.alias = alias
            self.name = name
            self.imageUrl = imageUrl
            self.isClosed = isClosed
            self.url = url
            self.reviewCount = reviewCount
            self.categories = categories
            self.rating = rating
            self.coordinates = coordinates
            self.transactions = transactions
            self.price = price
            self.location = location
            self.phone = phone
            self.displayPhone = displayPhone
            self.distance = distance
    }
    
    static func == (lhs: Business, rhs: Business) -> Bool {
        return lhs.id == rhs.id
        && lhs.alias == rhs.alias
        && lhs.name == rhs.name
        && lhs.imageUrl == rhs.imageUrl
        && lhs.isClosed == rhs.isClosed
        && lhs.url == rhs.url
        && lhs.reviewCount == rhs.reviewCount
        && lhs.rating == rhs.rating
        && lhs.transactions == rhs.transactions
        && lhs.price == rhs.price
        && lhs.phone == rhs.phone
        && lhs.displayPhone == rhs.displayPhone
    }
}
