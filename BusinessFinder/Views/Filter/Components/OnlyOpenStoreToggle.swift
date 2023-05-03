//
//  OnlyOpenStoreToggle.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct OnlyOpenStoreToggle: View {
    @EnvironmentObject private var viewModel: FilterViewModel
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Open Store")
        }
        .onChange(of: isOn) { newValue in
            viewModel.toggleIsOpen(newValue)
        }
    }
}
