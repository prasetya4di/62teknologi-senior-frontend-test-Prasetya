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
    @State private var onlyOpenStore = false
    @State private var selectedSortOption = SortOption(label: "", value: "")
    @State private var selectedPrice = ""
    
    var body: some View {
        VStack {
            NearbyBusinessToggle(isOn: $nearbyLocation)
            OnlyOpenStoreToggle(isOn: $onlyOpenStore)
            SortByPicker(
                selection: $selectedSortOption,
                sortOptions: viewModel.viewState.sortOptions
            )
            PriceSelector(selectedPrice: $selectedPrice)
            Spacer()
        }
        .onAppear {
            selectedSortOption = viewModel.viewState.selectedSortOption!
            nearbyLocation = viewModel.viewState.isNearbyLocationOn
            onlyOpenStore = viewModel.viewState.isOnlyOpenStore
            selectedPrice = viewModel.viewState.selectedPrice
        }
        .padding()
    }
}
