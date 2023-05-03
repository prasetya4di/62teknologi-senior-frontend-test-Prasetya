//
//  BusinessLocation.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

struct BusinessLocation {
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String?
    let zipCode: String?
    let country: String?
    let state: String?
    let displayAddress: [String]
    let crossStreets: String?
    
    init(response: BusinessResponseLocation) {
        address1 = response.address1
        address2 = response.address2
        address3 = response.address3
        city = response.city
        zipCode = response.zipCode
        country = response.country
        state = response.state
        displayAddress = response.displayAddress
        crossStreets = response.crossStreets
    }
    
    init(
        address1: String?,
        address2: String?,
        address3: String?,
        city: String?,
        zipCode: String?,
        country: String?,
        state: String?,
        displayAddress: [String],
        crossStreets: String?
    ) {
        self.address1 = address1
        self.address2 = address2
        self.address3 = address3
        self.city = city
        self.zipCode = zipCode
        self.country = country
        self.state = state
        self.displayAddress = displayAddress
        self.crossStreets = crossStreets
    }
}
