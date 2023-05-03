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
            .scaledToFit()
    }
}

struct DetailImageCover_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageCover(imageUrl: "https://s3-media1.fl.yelpcdn.com/bphoto/igyZItx5n3TjIKDFSHzuxQ/o.jpg")
    }
}
