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
    
    init(response: BusinessResponseHours) {
        hourType = response.hourType
        open = response.open.map { BusinessOpen(response: $0) }
        isOpenNow = response.isOpenNow
    }
}

struct BusinessOpen {
    let day: Int
    let start: String
    let end: String
    let isOvernight: Bool
    
    init(response: BusinessResponseOpen) {
        day = response.day
        start = response.start
        end = response.end
        isOvernight = response.isOvernight
    }
}
