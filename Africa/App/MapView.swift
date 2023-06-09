//
//  MapView.swift
//  Africa
//
//  Created by Beni Ibeh on 02/06/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: PROPERTIES
    @State private var region:MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    //MARK: BODY
    var body: some View {
        //MARK: No 1 BASIC MAP
        
        //MARK: No 2 ADVANCED MAP
        Map(coordinateRegion: $region,annotationItems: locations) { parkLocations in
            // (A) PIN: OLD STYLE (Always static)
            //  MapPin(coordinate: parkLocations.location,tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (always static)
            //  MapMarker(coordinate: parkLocations.location,tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: parkLocations.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32,height: 32,alignment: .center)
//            }//: ANNOTATIONS
            
            // (D) custom advanced
            MapAnnotation(coordinate: parkLocations.location) {
                MapAnnotationView(locations: parkLocations)
            }
        }
        .overlay(
            HStack {
                Image("compass")
                .resizable()
                .scaledToFit()
            .frame(width: 48,height: 48,alignment: .center)
                
                VStack(alignment: .leading,spacing: 3){
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } // HSTACK
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
