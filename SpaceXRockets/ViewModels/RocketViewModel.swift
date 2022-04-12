//
//  RocketViewModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import Foundation

struct RocketViewModel: Codable {
    
    // add settings
    
    // MARK: - imageview

    
    var rockets: Rocket
    
    var name: String {
        return rockets.name ?? "kakoeto name"
    }
    
    var id: String {
        return rockets.id
    }
    
    var imageURL: String {
        rockets.flickr_images.randomElement()!
//        return URL(string: rockets.flickr_images.randomElement()!)!
    }
    
    // MARK: - cell
    
    // all meters
    
    // force unwrap
    var parameters: [[String]] {
        let hightArr = ["высота", "m", String(rockets.height.meters!)]
        let diameterArr = ["", "", String(rockets.diameter.meters!)]
        let weightArr = ["", "", String(rockets.mass.kg!)]
        
        let leo = rockets.payload_weights.filter { $0.id == "leo" }.first!
        let payloadArr = ["", "", String(leo.kg!)]
        
        let parametersArr = [hightArr, diameterArr, weightArr, payloadArr]
        
        return parametersArr
    }
    
    
    

//
//    var height: Double {
//        return rockets.height.meters ?? 0
//    }
//
//    var mass: Double {
//        return rockets.mass.kg ?? 0
//    }

//    var payload: Double {
//        return rockets.payload_weights.kg ?? 0
//    }

    
    
    // force unwrap
    
    
}

