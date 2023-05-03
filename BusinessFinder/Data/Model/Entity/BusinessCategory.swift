//
//  BusinessCategory.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

struct BusinessCategory {
    let alias: String
    let title: String
    
    init(response: BusinessResponseCategory) {
        alias = response.alias
        title = response.title
    }
    
    init(alias: String, title: String) {
        self.alias = alias
        self.title = title
    }
}
