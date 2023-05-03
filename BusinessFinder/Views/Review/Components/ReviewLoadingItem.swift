//
//  ReviewLoadingItem.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct ReviewLoadingItem: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 60, height: 60)
                Text("Profile name")
                    .font(.title2)
                    .redacted(reason: .placeholder)
                Spacer()
            }
            
            HStack {
                BusinessRating(score: 0)
                Text("Review Date")
                    .font(.title2)
                    .redacted(reason: .placeholder)
                Spacer()
            }
            
            Text(String(repeating: "Shimmer", count: 12))
                .font(.title2)
                .redacted(reason: .placeholder)
        }
        .shimmering()
    }
}

struct ReviewLoadingItem_Previews: PreviewProvider {
    static var previews: some View {
        ReviewLoadingItem()
    }
}
