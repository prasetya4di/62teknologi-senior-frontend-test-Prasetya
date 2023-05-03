//
//  SortOptionDao.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol SortOptionDao {
    func getAllSortOption() -> [SortOption]
}

class SortOptionDaoImpl: SortOptionDao {
    func getAllSortOption() -> [SortOption] {
        [
            SortOption(label: "Best Match", value: "best_match"),
            SortOption(label: "Rating", value: "rating"),
            SortOption(label: "Review Count", value: "review_count"),
        ]
    }
}
