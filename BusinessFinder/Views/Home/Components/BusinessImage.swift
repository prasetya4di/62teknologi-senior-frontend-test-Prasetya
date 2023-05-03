//
//  BusinessImage.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Kingfisher
import SwiftUI

struct BusinessImage: View {
    let imageUrl: String
    
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .frame(width: 80, height: 80)
    }
}

struct BusinessImage_Previews: PreviewProvider {
    static var previews: some View {
        BusinessImage(imageUrl: "https://s3-media1.fl.yelpcdn.com/bphoto/igyZItx5n3TjIKDFSHzuxQ/o.jpg")
    }
}
