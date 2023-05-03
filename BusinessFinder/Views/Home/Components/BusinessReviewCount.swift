//
//  BusinessReviewCount.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessReviewCount: View {
    let total: Int
    
    var body: some View {
        Text("(\(total) reviews)")
            .font(.caption)
            .foregroundColor(.gray)
    }
}

struct BusinessReviewCount_Previews: PreviewProvider {
    static var previews: some View {
        BusinessReviewCount(total: 356)
    }
}
