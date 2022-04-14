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
    
    // MARK: - MainImage

    //
    let name: String
    let flickr_images: [String]
    // for additional
    let description: String
    let wikipedia: String
    //
    
    // MARK: - Cell

    let height: Height
    let diameter: Diameter
    let mass: Weight
    let payload_weights: [Payload]

//
    let id: String
    //
    
    // MARK: - Description
    
    let first_flight: String
    let country: String
    let cost_per_launch: Int
    let first_stage: Stage
    let second_stage: Stage
    
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

struct Payload: Codable {
    let id: String?
    let kg: Double?
    let lb: Double?
}

struct Stage: Codable {
    let engines: Int?
    let fuel_amount_tons: Double?
    let burn_time_sec: Int?
}
