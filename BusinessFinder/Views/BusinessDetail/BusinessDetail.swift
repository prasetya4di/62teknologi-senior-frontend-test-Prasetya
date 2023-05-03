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
        ScrollView {
            if business.photos.isEmpty {
                DetailImageCover(imageUrl: business.imageUrl)
            }
            
            if !business.photos.isEmpty {
                DetailImageSlideCover(photos: business.photos)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    BusinessDetailName(name: business.name)
                    Spacer()
                    VStack {
                        BusinessRating(score: business.rating)
                        BusinessReviewCount(total: business.reviewCount)
                    }
                }
                
                HStack {
                    DetailPrice(price: business.price ?? "")
                    
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 5, height: 5)
                    
                    BusinessCategories(categories: business.categoriesName)
                }
                .padding(.top, -16)
                
                if let hours = business.hours.first {
                    DetailOpenHour(businessHours: hours)
                }
                
                Divider()
                
                DetailActions(phoneNumber: business.phone, location: business.locationCoordinate, url: business.url)
                
                Divider()
                
                DetailMap(coordinate: business.locationCoordinate)
                
                Divider()
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct BusinessDetail_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetail(
            business: Business(
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
                distance: 5061.886989832781,
                photos: [
                    "https://s3-media1.fl.yelpcdn.com/bphoto/igyZItx5n3TjIKDFSHzuxQ/o.jpg",
                    "https://s3-media1.fl.yelpcdn.com/bphoto/ZBsZDtc8Kyx1GKfPRE31UA/o.jpg",
                    "https://s3-media4.fl.yelpcdn.com/bphoto/PeWh0FHtrOdgQkgOmwAhhw/o.jpg"
                ],
                hours: [
                    BusinessHours(
                        hourType: "Regular",
                        open: [
                            BusinessOpen(
                                day: 0,
                                start: "1600",
                                end: "2000",
                                isOvernight: false
                            ),
                            BusinessOpen(
                                day: 1,
                                start: "1600",
                                end: "2000",
                                isOvernight: false
                            ),
                            BusinessOpen(
                                day: 2,
                                start: "1600",
                                end: "2000",
                                isOvernight: false
                            ),
                            BusinessOpen(
                                day: 3,
                                start: "1600",
                                end: "2000",
                                isOvernight: false
                            ),
                            BusinessOpen(
                                day: 4,
                                start: "1600",
                                end: "0100",
                                isOvernight: true
                            ),
                            BusinessOpen(
                                day: 5,
                                start: "1600",
                                end: "0100",
                                isOvernight: true
                            ),
                            BusinessOpen(
                                day: 6,
                                start: "1600",
                                end: "2000",
                                isOvernight: false
                            ),
                        ],
                        isOpenNow: false)
                ]
            )
        )
    }
}
