//
//  ReviewItem.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct ReviewItem: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                ReviewProfilePicture(imageUrl: review.user.imageURL)
                ReviewName(name: review.user.name)
                Spacer()
            }
            
            HStack {
                BusinessRating(score: review.rating)
                ReviewDate(date: review.timeCreated)
            }
            
            ReviewText(text: review.text)
            
            Divider()
        }
    }
}

struct ReviewItem_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItem(review: Review(
            id: "id",
            url: "https://www.yelp.com/biz/barbacoa-grill-boise?adjust_creative=DSj6I8qbyHf-Zm2fGExuug&hrid=MD_RWUiEj4scIW0C1X930g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_reviews&utm_source=DSj6I8qbyHf-Zm2fGExuug",
            text: "This restaurant is on FIRE.  From the moment you walk in the door- you're the ultimate hipster and the staff give you the love like you are.  \n\nThe food is...",
            rating: 5,
            timeCreated: "2023-03-31 10:46:13",
            user: User(
                id: "JmWLTphef61ujj7LvrQKTw",
                profileURL: "https://www.yelp.com/user_details?userid=JmWLTphef61ujj7LvrQKTw",
                imageURL: "https://s3-media2.fl.yelpcdn.com/photo/0eBdAsNYSt-Idz50tW0ABA/o.jpg",
                name: "Paul L.")))
    }
}
