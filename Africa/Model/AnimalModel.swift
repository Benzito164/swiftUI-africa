//
//  AnimalModel.swift
//  Africa
//
//  Created by Beni Ibeh on 03/06/2023.
//

import Foundation

struct Animal : Codable, Identifiable {
    let id:String
    let name:String
    let headline:String
    let link:String
    let image:String
    let description:String
    let gallery:[String]
    let fact:[String]
}
