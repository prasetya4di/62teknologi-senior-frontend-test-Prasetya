//
//  DetailImageCover.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Kingfisher
import SwiftUI

struct DetailImageCover: View {
    let imageUrl: String
    
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .scaledToFill()
            .frame(
                width: UIScreen.main.bounds.size.width,
                height: 300)
            .clipped()
    }
}

struct DetailImageCover_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageCover(imageUrl: "https://s3-media1.fl.yelpcdn.com/bphoto/igyZItx5n3TjIKDFSHzuxQ/o.jpg")
    }
}
