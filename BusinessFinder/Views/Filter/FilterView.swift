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
                NearbyBusinessToggle(isOn: $nearbyLocation)
                OnlyOpenStoreToggle(isOn: $onlyOpenStore)
                SortByPicker(
                    selection: $selectedSortOption,
                    sortOptions: viewModel.viewState.sortOptions
                )
                PriceSelector(selectedPrice: $selectedPrice)
            }
            
            Spacer()
            
            Divider()
                        
            HStack {
                Spacer()
                
                Button("Cancel") {
                    isShow = false
                }
                .padding()
                
                Button("Apply") {
                    // Apply the selected filter options
                    isShow = false
                }
                .padding()
            }
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
