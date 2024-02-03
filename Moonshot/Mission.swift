//
//  Mission.swift
//  Moonshot
//
//  Created by Kevin Muniz on 1/31/24.
//

import Foundation


struct Mission: Codable, Identifiable {
    
    struct crewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    
    let launchDate: String?
    
    let crew: [crewRole]
    
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    
    
}
