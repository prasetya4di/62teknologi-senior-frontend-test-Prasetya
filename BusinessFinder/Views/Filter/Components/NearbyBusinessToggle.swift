//
//  NearbyBusinessToggle.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct NearbyBusinessToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Nearby Business")
        }
    }
}

struct NearbyBusinessToggle_Previews: PreviewProvider {
    static var previews: some View {
        NearbyBusinessToggle(isOn: .constant(true))
    }
}
