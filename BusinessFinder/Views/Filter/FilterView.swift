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
    
    @Binding var isShow: Bool
    
    var body: some View {
        VStack {
            Text("Filter")
                .font(.title)
                .fontWeight(.bold)
            
            Divider()
            
            Section {
                OnlyOpenStoreToggle(isOn: $onlyOpenStore)
                SortByPicker(
                    selection: $selectedSortOption,
                    sortOptions: viewModel.viewState.sortOptions
                )
                PriceSelector(selectedPrice: $selectedPrice)
            }
            
            Spacer()
            
            Divider()
                        
            FilterActions(isShow: $isShow)
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
