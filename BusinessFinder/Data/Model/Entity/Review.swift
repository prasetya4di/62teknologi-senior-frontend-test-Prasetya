//
//  Review.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct Review: Equatable {
    let id: String
    let url: String
    let text: String
    let rating: Int
    let timeCreated: String
    let user: User
    
    init(response: ReviewResponseData) {
        self.id = response.id
        self.url = response.url
        self.text = response.text
        self.rating = response.rating
        self.timeCreated = response.timeCreated
        self.user = User(response: response.user)
    }
    
    init(id: String, url: String, text: String, rating: Int, timeCreated: String, user: User) {
        self.id = id
        self.url = url
        self.text = text
        self.rating = rating
        self.timeCreated = timeCreated
        self.user = user
    }
}
