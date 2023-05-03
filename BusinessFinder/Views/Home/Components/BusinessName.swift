//
//  BusinessName.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessName: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.title2)
            .fontWeight(.bold)
    }
}

struct BusinessName_Previews: PreviewProvider {
    static var previews: some View {
        BusinessName(name: "Barbacoa Grill")
    }
}
