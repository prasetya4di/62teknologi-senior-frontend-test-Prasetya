//
//  FilterView.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct FilterView: View {
    @State private var nearbyLocation = false
    
    var body: some View {
        VStack {
            NearbyBusinessToggle(isOn: $nearbyLocation)
        }
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
