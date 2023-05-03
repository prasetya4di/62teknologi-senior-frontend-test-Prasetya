//
//  BusinessDetail.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessDetail: View {
    let business: Business
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BusinessDetail_Previews: PreviewProvider {
    let business: Business = Business(
        id: "id",
        alias: "barbacoa-grill-boise",
        name: "Barbacoa Grill",
        imageUrl: "https://s3-media1.fl.yelpcdn.com/bphoto/igyZItx5n3TjIKDFSHzuxQ/o.jpg",
        isClosed: false,
        url: "https://www.yelp.com/biz/barbacoa-grill-boise?adjust_creative=DSj6I8qbyHf-Zm2fGExuug&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=DSj6I8qbyHf-Zm2fGExuug",
        reviewCount: 1326,
        categories: [
            BusinessCategory(alias: "steak", title: "SteakHouses"),
            BusinessCategory(alias: "seafood", title: "Seafood"),
            BusinessCategory(alias: "bars", title: "Bars")],
        rating: 4,
        coordinates: BusinessCoordinate(
            latitude: 43.59759,
            longitude: -116.18383
        ),
        transactions: ["delivery"],
        price: "$$$",
        location: BusinessLocation(
            address1: nil,
            address2: nil,
            address3: nil,
            city: nil,
            zipCode: nil,
            country: nil,
            state: nil,
            displayAddress: ["276 W Bobwhite Ct","Boise, ID 83706"],
            crossStreets: nil),
        phone: "+12083385000",
        displayPhone: "(208) 338-5000",
        distance: 5061.886989832781)
    
    static var previews: some View {
        BusinessDetail(business: business)
    }
}
