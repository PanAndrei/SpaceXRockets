//
//  LaunchModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 14.04.2022.
//

import Foundation

struct Launch: Codable {
    
    let rocket: String
    let success: Bool?
    let name: String
    let date_utc: String
}
