//
//  ContentView.swift
//  Africa
//
//  Created by Beni Ibeh on 02/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    let animals:[Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive:Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn:Int = 1
    @State private var toolBarIcon:String = "square.grid.2x2"
     
    //MARK: FUNCTIONS
    func gridSwitch(){
        gridLayout = Array(repeating:.init(.flexible()),count: gridLayout.count % 3 + 1 )
        gridColumn = gridLayout.count
        print("Grid number \(gridColumn)")
     
        switch gridColumn {
        case 1 :
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
        
    }
    
    
    //MARK: BODY
    var body: some View {
        NavigationView{
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        }
                    }//:LIST
                }
                else {
                    ScrollView(.vertical,showsIndicators: false ){
                        LazyVGrid(columns: gridLayout, alignment: .center,spacing:10) {
                            ForEach(animals){
                                animal in
                                NavigationLink(destination:AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }//LOOP
                        }//GRID
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }//:GROUP
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            
            //MARK: TOOLBAR
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing:16) {
                        //LIST
                        Button(action: {
                            print("list view activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary:.accentColor)
                        }
                        
                        //GRID
                        Button {
                            print("gridi is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }

                    }//:HSTACK
                }
            }
        }//:NAVIGATION

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
