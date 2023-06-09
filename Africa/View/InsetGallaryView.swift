//
//  InsetGallaryView.swift
//  Africa
//
//  Created by Beni Ibeh on 04/06/2023.
//

import SwiftUI

struct InsetGallaryView: View {
    
    //MARK: PROPERTIES
    let animal:Animal
    
    //MARK: BODY
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment:.center, spacing: 15) {
                ForEach(animal.gallery, id:\.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            } //:HSTACK
        }//:SCROLL
    }
}

struct InsetGallaryView_Previews: PreviewProvider {
    static let animal:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGallaryView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
