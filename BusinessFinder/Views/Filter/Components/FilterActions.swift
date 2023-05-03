//
//  FilterActions.swift
//  BusinessFinder
//
//  Created by Prasetya on 04/05/23.
//

import SwiftUI

struct FilterActions: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @EnvironmentObject private var filterViewModel: FilterViewModel
    
    @Binding var isShow: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button("Cancel") {
                isShow = false
            }
            .padding()
            
            Button("Apply") {
                homeViewModel.filterBusiness(
                    sortOption: filterViewModel.viewState.selectedSortOption,
                    nearbyLocation: filterViewModel.viewState.isNearbyLocationOn,
                    onlyOpenStore: filterViewModel.viewState.isOnlyOpenStore,
                    selectedPrice: filterViewModel.viewState.selectedPrice)
                isShow = false
            }
            .padding()
        }
    }
}
