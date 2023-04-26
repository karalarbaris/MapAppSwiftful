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
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    
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
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        // get the current index
        let currentIndex = locations.firstIndex { location in
            return location == mapLocation
        }
        guard let currentIndex else {
            print("Could not find current index. Should never happen")
            return
        }
        
        // or
//        let currentIndex = locations.firstIndex(where: { $0 == mapLocation })
        
        // Check if nextindex is valid
        if locations.count - currentIndex == 1 {
            print("Last item")
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
//        guard locations.indices.contains(currentIndex + 1) else {
//            guard let firstLocation = locations.first else { return }
//            showNextLocation(location: firstLocation)
//            return
//        }
        
        // Next index is valid
        let nextLocation = locations[currentIndex + 1]
        showNextLocation(location: nextLocation)
        
    }
    
}
