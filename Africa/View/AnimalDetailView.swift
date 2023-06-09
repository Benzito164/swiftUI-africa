//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Beni Ibeh on 03/06/2023.
//

import SwiftUI

struct AnimalDetailView: View {

    //MARK: PROPERTIES
    let animal:Animal
    
    
    //MARK: BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height:6)
                            .offset(y:24)
                    )
                
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGallaryView(animal: animal)
                }.padding(.horizontal)
                
                // FACTS
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactview(animal: animal)
                }.padding(.horizontal)
                
                // DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }//:GROUP
                .padding(.horizontal)
                
                // MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }//: GROUP
                .padding(.horizontal)
                
                // LINK
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }.padding(.horizontal)
            }//:VSTACK
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
            
        }//:SCROLL VIEW
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animal:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animal[0])
        }
        
    }
}
