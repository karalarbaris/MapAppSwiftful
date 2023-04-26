//
//  LocationsViewModel.swift
//  MapAppSwiftful
//
//  Created by Baris Karalar on 26.04.23.
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location
    @Published var mapLocation : Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            self.mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude), span: mapSpan)
        }
    }
    
}
