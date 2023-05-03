//
//  BusinessRating.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessRating: View {
    let score: Double
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(index > Int(score) ? .gray : .yellow)
            }
        }
    }
}

struct BusinessRating_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRating(score: 3)
    }
}
