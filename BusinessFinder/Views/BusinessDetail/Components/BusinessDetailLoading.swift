//
//  BusinessDetailLoading.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI_Shimmer
import SwiftUI

struct BusinessDetailLoading: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.gray)
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Business Name")
                        .font(.title)
                        .fontWeight(.bold)
                        .redacted(reason: .placeholder)
                    Spacer()
                    BusinessRating(score: 0)
                }
                
                Text("Business Price and another categories")
                    .font(.body)
                    .fontWeight(.bold)
                    .redacted(reason: .placeholder)
                
                Text("Close")
                    .font(.body)
                    .fontWeight(.bold)
                    .redacted(reason: .placeholder)
                
                HStack {
                    Spacer()
                    Image(systemName: "phone.fill")
                    Spacer()
                    Image(systemName: "map.fill")
                    Spacer()
                    Image(systemName: "link")
                    Spacer()
                }
            }
            .padding()
             
            Spacer()
        }
        .shimmering()
    }
}

struct BusinessDetailLoading_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailLoading()
    }
}
