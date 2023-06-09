//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Beni Ibeh on 08/06/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    //:MARK: PROPERTIES
    let animal:Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animal:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
