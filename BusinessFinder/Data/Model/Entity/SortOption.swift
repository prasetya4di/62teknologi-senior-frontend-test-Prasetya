//
//  SortOption.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct SortOption: Identifiable, Hashable {
    let id = UUID()
    let label: String
    let value: String
}
