//
//  VideoModel.swift
//  Africa
//
//  Created by Beni Ibeh on 05/06/2023.
//

import Foundation

struct Video : Codable,Identifiable {
    let id: String
    let name:String
    let headline:String
    
    // Computed property
    var thumbnail : String {
        "video-\(id)"
    }
}
