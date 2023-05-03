//
//  NearbyBusinessToggle.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct NearbyBusinessToggle: View {
    @EnvironmentObject private var viewModel: FilterViewModel
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Nearby Business")
        }
        .onChange(of: isOn) { newValue in
            viewModel.toggleNearbyLocation(isOn)
        }
    }
}
