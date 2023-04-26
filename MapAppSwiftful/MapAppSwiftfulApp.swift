//
//  MapAppSwiftfulApp.swift
//  MapAppSwiftful
//
//  Created by Baris Karalar on 26.04.23.
//

import SwiftUI

@main
struct MapAppSwiftfulApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
