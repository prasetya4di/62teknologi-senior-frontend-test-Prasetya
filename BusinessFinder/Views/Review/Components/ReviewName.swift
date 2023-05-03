//
//  ReviewName.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct ReviewName: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.title3)
            .fontWeight(.bold)
    }
}

struct ReviewName_Previews: PreviewProvider {
    static var previews: some View {
        ReviewName(name: "Paul L.")
    }
}
