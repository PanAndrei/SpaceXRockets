//
//  RocketViewModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import Foundation

struct RocketViewModel: Codable {
    
    // add settings
    
    var rockets: Rocket
    
    var name: String {
        return rockets.name ?? "kakoeto name"
    }
    
    var height: Double {
        return rockets.height.meters ?? 0
    }
    
    var mass: Double {
        return rockets.mass.kg ?? 0
    }

//    var payload: Double {
//        return rockets.payload_weights.kg ?? 0
//    }

    var id: String {
        return rockets.id
    }
    
    // force unwrap
    var imageURL: String {
        rockets.flickr_images.randomElement()!
//        return URL(string: rockets.flickr_images.randomElement()!)!
    }
    
}

