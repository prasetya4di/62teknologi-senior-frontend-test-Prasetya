//
//  DetailActions.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import MapKit
import SwiftUI

struct DetailActions: View {
    let phoneNumber: String
    let location: CLLocationCoordinate2D
    let url: String
    
    var body: some View {
        HStack {
            Spacer()
            IconButton(label: "Call", icon: "phone.fill") {
                print("Call to \(phoneNumber)")
            }
            Spacer()
            IconButton(label: "Open Map", icon: "map.fill") {
                print("Open map to \(location)")
            }
            Spacer()
            IconButton(label: "Website", icon: "link") {
                print("Redirect to \(url)")
            }
            Spacer()
        }
        .padding(4)
    }
}

struct DetailActions_Previews: PreviewProvider {
    static var previews: some View {
        DetailActions(
            phoneNumber: "+62928392",
            location: CLLocationCoordinate2D(
                latitude: 34.011_286,
                longitude: -116.166_868
            ),
            url: "url"
        )
    }
}
