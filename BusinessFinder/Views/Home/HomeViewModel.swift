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
    private let searchBusiness: SearchBusiness
    private let loadMoreBusiness: LoadMoreBusiness
    
    init(getBusiness: GetBusiness, searchBusiness: SearchBusiness, loadMoreBusiness: LoadMoreBusiness) {
        self.getBusiness = getBusiness
        self.searchBusiness = searchBusiness
        self.loadMoreBusiness = loadMoreBusiness
    }
    
    func fetchBusiness() {
        viewState.offset = 0
        
        Just(())
            .prepend(viewState.isLoading.toggle())
            .asyncMap {
                try await self.getBusiness.call()
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
        
        Just(())
            .prepend(viewState.isLoading.toggle())
            .asyncMap {
                try await self
                    .searchBusiness
                    .call(
                        location: self.viewState.location,
                        term: key)
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
                self.viewState.searchKey = key
                self.viewState.businesses = data
            }
            .store(in: &cancellables)
    }
    
    func loadMoreData() {
        guard !viewState.isLoadMore else {
            return
        }
        
        viewState.offset += viewState.limit
        
        Just(())
            .prepend(viewState.isLoadMore.toggle())
            .asyncMap {
                try await self.loadMoreBusiness.call(
                    location: self.viewState.location,
                    offset: self.viewState.offset,
                    term: self.viewState.searchKey)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.viewState.isLoadMore = false
                switch completion {
                case .failure(let error):
                    self.viewState.error = error
                case .finished:
                    break
                }
            } receiveValue: { data in
                self
                    .viewState
                    .businesses
                    .append(contentsOf: data)
            }
            .store(in: &cancellables)
    }
}
