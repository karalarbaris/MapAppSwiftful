//
//  Location.swift
//  MapAppSwiftful
//
//  Created by Baris Karalar on 26.04.23.
//

import Foundation
import MapKit

struct Location: Identifiable {
    
    var id: String {
        name + cityName
    }
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
}
