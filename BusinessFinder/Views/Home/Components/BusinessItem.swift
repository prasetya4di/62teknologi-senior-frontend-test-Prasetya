//
//  BusinessItem.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI
import Kingfisher

struct BusinessItem: View {
    let business: Business
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                BusinessImage(imageUrl: business.imageUrl)
                
                VStack(alignment: .leading, spacing: 6) {
                    BusinessName(name: business.name)
                    HStack {
                        BusinessRating(score: business.rating)
                        BusinessReviewCount(total: business.reviewCount)
                    }
                    BusinessCategories(categories: business.categoriesName)
                    BusinessAddress(displayAddress: business.location.displayAddress)
                }
                
                Spacer()
            }
            
            Divider()
        }
    }
}
