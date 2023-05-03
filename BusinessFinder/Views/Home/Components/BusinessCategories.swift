//
//  BusinessCategories.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessCategories: View {
    let categories: [String]
    
    var body: some View {
        Text(categories.joined(separator: ", "))
            .font(.caption2)
            .foregroundColor(.blue)
    }
}

struct BusinessCategories_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCategories(categories: ["SteakHouses", "Seafood", "Bars"])
    }
}
