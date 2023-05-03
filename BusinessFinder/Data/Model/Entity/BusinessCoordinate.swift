//
//  BusinessCoordinate.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

struct BusinessCoordinate {
    let latitude: Double
    let longitude: Double
    
    init(response: BusinessResponseCoordinate) {
        latitude = response.latitude
        longitude = response.longitude
    }
}
