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
}
