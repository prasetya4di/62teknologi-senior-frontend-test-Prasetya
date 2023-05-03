//
//  BusinessRating.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessRating: View {
    let score: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(index > score ? .gray : .yellow)
                    .padding(-5)
            }
        }
    }
}

struct BusinessRating_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRating(score: 3)
    }
}
