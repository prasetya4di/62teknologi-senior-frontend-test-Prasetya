//
//  FilterRepository.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol FilterRepostory {
    func getSortOptions() -> [SortOption]
}

class FilterRepositoryImpl: FilterRepostory {
    private let sortOptionDao: SortOptionDao
    
    init(sortOptionDao: SortOptionDao) {
        self.sortOptionDao = sortOptionDao
    }
    
    func getSortOptions() -> [SortOption] {
        sortOptionDao.getSortOptions()
    }
}
