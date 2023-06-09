//
//  GalleryView.swift
//  Africa
//
//  Created by Beni Ibeh on 02/06/2023.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: PROPERTIES
    let animals:[Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal:String = "lion"
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID
//    let gridLayout:[GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
   // let gridLayout: [GridItem] =  Array(repeating:GridItem(.flexible()),count:3)
    
    
    //DYNAMIC GRID LAYOUT
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn:Double = 3.0
    
    
    //MARK: FUNCTION
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            
            VStack (alignment: .center, spacing:30){
                //MARK: IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 8))
              
                //MARK: SLIDER
                Slider(value: $gridColumn, in: 2...4,step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                //MARK: GRID
                LazyVGrid(columns: gridLayout,alignment: .center) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    }
                }
                .onAppear(perform:  {
                    gridSwitch()
                })
            }// VSTACK
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(MotionAnimationView())
        
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
