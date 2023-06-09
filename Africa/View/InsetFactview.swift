//
//  InsetFactview.swift
//  Africa
//
//  Created by Beni Ibeh on 04/06/2023.
//

import SwiftUI

struct InsetFactview: View {
    
    //MARK: PROPERTIES
    let animal:Animal
    
    //MARK: BODY
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact,id: \.self){
                    item in
                    Text(item)
                }
            }//: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 148,idealHeight: 168,maxHeight: 180)
        }//: BOX
    }
}

struct InsetFactview_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactview(animal: animals[0])
    }
}
