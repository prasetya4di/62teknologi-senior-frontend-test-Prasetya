//
//  BusinessHours.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

struct BusinessHours {
    let hourType: String
    let open: [BusinessOpen]
    let isOpenNow: Bool
}

struct BusinessOpen {
    let day: Int
    let start: String
    let end: String
    let isOvernight: Bool
}
