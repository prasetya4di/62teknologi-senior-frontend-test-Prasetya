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
        .asyncMap {
            try await self.getBusiness.call()
        }
        .sink { completion in
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
