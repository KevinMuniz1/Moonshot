//
//  Bundle-decodable.swift
//  Moonshot
//
//  Created by Kevin Muniz on 1/30/24.
//

import Foundation

extension Bundle {
    
    func decodeAstro<T: Codable>(_ file: String) -> T {
        guard let fileurl = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find file \(file)")
        }
        
        guard let data = try? Data(contentsOf: fileurl) else {
            fatalError("Could not load data")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Could not decode data from \(file)")
        }
        
        return loaded
    }
    
}
