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
    let name: String
    let location: CLLocationCoordinate2D
    let url: String
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        HStack {
            Spacer()
            IconButton(label: "Call", icon: "phone.fill") {
                let phone = "tel://"
                let phoneNumberformatted = phone + phoneNumber
                guard let url = URL(string: phoneNumberformatted) else { return }
                openURL(url)
            }
            Spacer()
            IconButton(label: "Open Map", icon: "map.fill") {
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: location))
                mapItem.name = "\(name) Location"
                mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
            }
            Spacer()
            IconButton(label: "Website", icon: "link") {
                openURL(URL(string: url)!)
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
            name: "Business",
            location: CLLocationCoordinate2D(
                latitude: 34.011_286,
                longitude: -116.166_868
            ),
            url: "url"
        )
    }
}
