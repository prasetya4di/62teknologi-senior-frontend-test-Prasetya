//
//  DetailImageSlideCover.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct DetailImageSlideCover: View {
    let photos: [String]
    @State private var index: Int = 0
    
    var body: some View {
        ZStack {
            DetailImageCover(imageUrl: photos[index])
            Rectangle()
                .fill(Color.black.opacity(0.2))
            
            VStack {
                Spacer()
                HStack {
                    ForEach(0...photos.count-1, id: \.self) { id in
                        Circle()
                            .fill(id == index ? .white : .white.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding()
            }
            HStack {
                Button {
                    updateIndex(-1)
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .bold()
                }
                Spacer()
                Button {
                    updateIndex(1)
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
        }
        .frame(height: 300)
    }
    
    func updateIndex(_ value: Int) {
        withAnimation {
            if index + value < 0 {
                index = photos.count - 1
            } else if index + value > photos.count - 1 {
                index = 0
            } else {
                index += value
            }
        }
    }
}

struct DetailImageSlideCover_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageSlideCover(photos: [
            "https://s3-media1.fl.yelpcdn.com/bphoto/igyZItx5n3TjIKDFSHzuxQ/o.jpg",
            "https://s3-media1.fl.yelpcdn.com/bphoto/ZBsZDtc8Kyx1GKfPRE31UA/o.jpg",
            "https://s3-media4.fl.yelpcdn.com/bphoto/PeWh0FHtrOdgQkgOmwAhhw/o.jpg"
        ])
    }
}
