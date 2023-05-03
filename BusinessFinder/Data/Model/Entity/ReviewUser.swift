//
//  ReviewUser.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct User: Equatable {
    let id: String
    let profileURL: String
    let imageURL: String
    let name: String
    
    init(response: ReviewResponseUser) {
        self.id = response.id
        self.profileURL = response.profileURL
        self.imageURL = response.imageURL
        self.name = response.name
    }

    init(id: String, profileURL: String, imageURL: String, name: String) {
        self.id = id
        self.profileURL = profileURL
        self.imageURL = imageURL
        self.name = name
    }
}
