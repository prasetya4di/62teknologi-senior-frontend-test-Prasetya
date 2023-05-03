//
//  HomeLoadingItem.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct HomeLoadingItem: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Rectangle()
                    .fill(.gray)
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(String(repeating: "Name", count: 8))
                        .redacted(reason: .placeholder)
                    HStack {
                        BusinessRating(score: 0)
                        Text("Review Count")
                            .redacted(reason: .placeholder)
                    }
                    Text("Categories")
                        .redacted(reason: .placeholder)
                    Text("Display Address")
                        .redacted(reason: .placeholder)
                }
                
                Spacer()
            }
            
            Divider()
        }
        .shimmering()
    }
}

struct HomeLoadingItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeLoadingItem()
    }
}
