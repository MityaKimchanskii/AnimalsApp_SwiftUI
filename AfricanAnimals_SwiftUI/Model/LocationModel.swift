//
//  LocationModel.swift
//  AfricanAnimals_SwiftUI
//
//  Created by Mitya Kim on 11/15/22.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
