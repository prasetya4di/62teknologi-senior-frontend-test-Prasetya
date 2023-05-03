//
//  FilterView.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject private var viewModel: FilterViewModel
    
    @State private var nearbyLocation = false
    @State private var selectedSortOption: SortOption
    
    var body: some View {
        VStack {
            NearbyBusinessToggle(isOn: $nearbyLocation)
            SortByPicker(
                selection: $selectedSortOption,
                sortOptions: viewModel.viewState.sortOptions
            )
            Spacer()
        }
        .onAppear {
            selectedSortOption = viewModel.viewState.selectedSortOption!
            nearbyLocation = viewModel.viewState.isNearbyLocationOn
        }
        .padding()
    }
}
