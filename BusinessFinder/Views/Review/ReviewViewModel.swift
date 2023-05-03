//
//  ReviewViewModel.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Combine
import Foundation

class ReviewViewModel: ObservableObject {
    @Published var viewState: ReviewViewState = ReviewViewState.idle()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let getReviews: GetBusinessReviews
    
    init(getReviews: GetBusinessReviews) {
        self.getReviews = getReviews
    }
    
    func fetchReviews(id: String) {
        Just(())
            .prepend(viewState.isLoading.toggle())
            .asyncMap {
                try await self.getReviews.call(id: id)
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
                self.viewState.reviews = data
            }
            .store(in: &cancellables)
    }
}
