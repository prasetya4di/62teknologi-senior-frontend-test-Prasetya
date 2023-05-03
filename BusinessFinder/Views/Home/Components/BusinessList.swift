//
//  BusinessList.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessList: View {
    var body: some View {
        VStack {
            ForEach(0...5, id: \.self) { _ in
                BusinessItem()
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
