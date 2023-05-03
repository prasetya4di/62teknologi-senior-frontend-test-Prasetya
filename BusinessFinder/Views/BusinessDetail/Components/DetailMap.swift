//
//  DetailMap.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import MapKit
import SwiftUI

struct DetailMap: View {
    let coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: [AnnotationItem(coordinate: coordinate)]) { item in
                MapAnnotation(coordinate: item.coordinate) {
                Image(systemName: "mappin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12)
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            setRegion(coordinate)
        }
        .frame(height: 300)
        .disabled(true)
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

extension DetailMap {
    struct AnnotationItem: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
}

struct DetailMap_Previews: PreviewProvider {
    static var previews: some View {
        DetailMap(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
