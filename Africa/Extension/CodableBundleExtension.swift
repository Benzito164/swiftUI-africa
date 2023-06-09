//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Beni Ibeh on 03/06/2023.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file:String) -> T {
        //1. locate json  file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate\(file) in bundle")
        }
        
        //2. create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from bundle")
        }
        
        //3. create a decoder
        let decoder = JSONDecoder()
        
        //4. create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        //5.  return the data
        return loaded
    }
}
