//
//  RocketModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import Foundation
//
// use keys
//
struct Rocket: Codable {
    
    let name: String
    
    let height: Height
    let diameter: Diameter
    let mass: Weight
//    let payload_weights: Payload

    let id: String
    
    let flickr_images: [String]
}

struct Height: Codable {
    let meters: Double?
    let feet: Double?
}

struct Diameter: Codable {
    let meters: Double?
    let feet: Double?
}

struct Weight: Codable {
    let kg: Double?
    let lb: Double?
}

//struct Payload: Codable {
//    let kg: Double?
//    let lb: Double?
//}

