//
//  BusinessDetailViewModel.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Combine
import Foundation

class BusinessDetailViewModel: ObservableObject {
    @Published var viewState = BusinessDetailViewState.idle()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let getBusinessDetail: GetBusinessDetail
    
    init(getBusinessDetail: GetBusinessDetail) {
        self.getBusinessDetail = getBusinessDetail
    }
    
    func fetchBusinessDetail(id: String) {
        Just(())
            .prepend(viewState.isLoading.toggle())
            .asyncMap {
                try await self.getBusinessDetail.call(id: id)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.viewState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.viewState.error = error
                    print("Error when get business detail")
                    print(error)
                    print(error.asAFError?.localizedDescription)
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { data in
                self.viewState.business = data
            }
            .store(in: &cancellables)
    }
}
