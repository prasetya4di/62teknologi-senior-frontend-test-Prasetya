//
//  BusinessDetailName.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessDetailName: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.title2)
            .fontWeight(.bold)
    }
}

struct BusinessDetailName_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailName(name: "Barbacoa Grill")
    }
}
