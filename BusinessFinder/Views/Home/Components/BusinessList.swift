//
//  BusinessList.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessList: View {
    let businesses: [Business]
    
    var body: some View {
        VStack {
            ForEach(businesses, id: \.self.id) { business in
                BusinessItem(
                    business: business
                )
            }
        }
    }
}
