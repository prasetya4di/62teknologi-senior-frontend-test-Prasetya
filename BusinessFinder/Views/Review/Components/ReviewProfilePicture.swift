//
//  ReviewProfilePic.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Kingfisher
import SwiftUI

struct ReviewProfilePicture: View {
    let imageUrl: String?
    
    @ViewBuilder
    var body: some View {
        if let imageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
        } else {
            Image("EmptyProfilePicture")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
        }
    }
}

struct ReviewProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        ReviewProfilePicture(imageUrl: "https://s3-media2.fl.yelpcdn.com/photo/0eBdAsNYSt-Idz50tW0ABA/o.jpg")
    }
}
