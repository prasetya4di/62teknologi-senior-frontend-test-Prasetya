//
//  GetSortOptions.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol GetSortOptions {
    func call() -> [SortOption]
}

class GetSortOptionsImpl: GetSortOptions {
    private let repository: FilterRepostory
    
    init(repository: FilterRepostory) {
        self.repository = repository
    }
    
    func call() -> [SortOption] {
        repository.getSortOptions()
    }
}
