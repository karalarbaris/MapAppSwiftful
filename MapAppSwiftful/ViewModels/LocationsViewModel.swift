//
//  LocationsViewModel.swift
//  MapAppSwiftful
//
//  Created by Baris Karalar on 26.04.23.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        locations = LocationsDataService.locations
    }
}
