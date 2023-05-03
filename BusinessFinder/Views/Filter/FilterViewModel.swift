//
//  FilterViewModel.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

class FilterViewModel: ObservableObject {
    @Published var viewState: FilterViewState = FilterViewState.idle()
    
    private let getSortOptions: GetSortOptions
    
    init(getSortOptions: GetSortOptions) {
        self.getSortOptions = getSortOptions
        
        getAllSortOptions()
    }
    
    func getAllSortOptions() {
        viewState.sortOptions = getSortOptions.call()
        viewState.selectedSortOption = viewState.sortOptions.first!
    }
    
    func toggleNearbyLocation(_ isEnable: Bool) {
        viewState.isNearbyLocationOn = isEnable
    }
    
    func changePrice(selected: String) {
        viewState.selectedPrice = selected
    }
    
    func changeSortOption(_ sortOption: SortOption) {
        viewState.selectedSortOption = sortOption
    }
    
    func toggleIsOpen(_ isOpen: Bool) {
        viewState.isOnlyOpenStore = isOpen
    }
}
