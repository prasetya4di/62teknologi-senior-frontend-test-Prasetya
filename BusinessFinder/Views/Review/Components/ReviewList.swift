//
//  ReviewList.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct ReviewList: View {
    let review: [Review]
    
    var body: some View {
        VStack {
            ForEach(review, id: \.self.id) { review in
                ReviewItem(review: review)
            }
        }
    }
}
