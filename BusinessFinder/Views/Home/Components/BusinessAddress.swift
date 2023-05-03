//
//  BusinessAddress.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessAddress: View {
    let displayAddress: [String]
    
    var body: some View {
        Text(displayAddress.joined(separator: ","))
            .font(.caption2)
            .foregroundColor(.gray)
    }
}

struct BusinessAddress_Previews: PreviewProvider {
    static var previews: some View {
        BusinessAddress(
            displayAddress: ["276 W Bobwhite Ct", "Boise, ID 83706"]
        )
    }
}
