//
//  MapView.swift
//  AfricanAnimals_SwiftUI
//
//  Created by Mitya Kim on 11/6/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        // MARK: - Basic Map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            //            MapPin(coordinate: item.location, tint: .accentColor)
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }//: MapAnnotation
        }//: Map
        .overlay (
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }//: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.3)
            )
            .padding()
            , alignment: .top
        )
    }
}


// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
