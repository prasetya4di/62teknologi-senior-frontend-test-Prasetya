//
//  SortOptionDao.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

protocol SortOptionDao {
    func getSortOptions() -> [SortOption]
}

class SortOptionDaoImpl: SortOptionDao {
    func getSortOptions() -> [SortOption] {
        [
            SortOption(label: "Best Match", value: "best_match"),
            SortOption(label: "Rating", value: "rating"),
            SortOption(label: "Review Count", value: "review_count"),
        ]
    }
}
