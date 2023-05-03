//
//  BusinessItem.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI
import Kingfisher

struct BusinessItem: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                BusinessImage(imageUrl: "https://s3-media1.fl.yelpcdn.com/bphoto/igyZItx5n3TjIKDFSHzuxQ/o.jpg")
                
                VStack(alignment: .leading, spacing: 6) {
                    BusinessName(name: "Barbacoa Grill")
                    HStack {
                        BusinessRating(score: 4)
                        BusinessReviewCount(total: 456)
                    }
                    BusinessCategories(categories: ["SteakHouses", "Seafood", "Bars"])
                    BusinessAddress(displayAddress: ["276 W Bobwhite Ct", "Boise, ID 83706"])
                }
                
                Spacer()
            }
            
            Divider()
        }
    }
}

struct BusinessItem_Previews: PreviewProvider {
    static var previews: some View {
        BusinessItem()
    }
}
