//
//  HomeViewModel.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var viewState = HomeViewState.idle()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let getBusiness: GetBusiness
    
    init(getBusiness: GetBusiness) {
        self.getBusiness = getBusiness
    }
    
    func fetchBusiness() {
        viewState.offset = 0
        viewState.isCanLoadMore = true
        
        Just(())
            .prepend(viewState.isLoading.toggle())
            .asyncMap {
                try await self.getBusiness.call(
                    location: self.viewState.location,
                    offset: self.viewState.offset,
                    filter: self.viewState.filters
                )
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.viewState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.viewState.error = error
                case .finished:
                    break
                }
            } receiveValue: { data in
                self.viewState.businesses = data
            }
            .store(in: &cancellables)
    }
    
    func fetchSearchBusiness(key: String) {
        viewState.offset = 0
        viewState.searchKey = key
        viewState.isCanLoadMore = true
        
        Just(())
            .prepend(viewState.isLoading.toggle())
            .asyncMap {
                try await self
                    .getBusiness
                    .call(
                        location: self.viewState.location,
                        offset: self.viewState.offset,
                        filter: self.viewState.filters
                    )
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.viewState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.viewState.error = error
                case .finished:
                    break
                }
            } receiveValue: { data in
                self.viewState.businesses = data
            }
            .store(in: &cancellables)
    }
    
    func loadMoreData() {
        guard !viewState.isLoadMore else {
            return
        }
        
        viewState.offset += viewState.limit
        viewState.isLoadMore = true
        
        Just(())
            .asyncMap {
                try await self.getBusiness.call(
                    location: self.viewState.location,
                    offset: self.viewState.offset,
                    filter: self.viewState.filters
                )
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.viewState.error = error
                case .finished:
                    break
                }
            } receiveValue: { data in
                self.viewState
                    .businesses
                    .append(contentsOf: data)
                self.viewState.isLoadMore = false
                self.viewState.isCanLoadMore = !data.isEmpty
            }
            .store(in: &cancellables)
    }
    
    func filterBusiness(
        sortOption: SortOption?,
        nearbyLocation: Bool,
        onlyOpenStore: Bool,
        selectedPrice: String
    ) {
        viewState.selectedSortOption = sortOption
        viewState.isNearbyLocationOn = nearbyLocation
        viewState.isOnlyOpenStore = onlyOpenStore
        viewState.selectedPrice = selectedPrice
        
        fetchSearchBusiness(key: viewState.searchKey)
    }
}
