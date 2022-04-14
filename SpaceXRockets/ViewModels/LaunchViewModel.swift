//
//  LaunchModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 14.04.2022.
//

import Foundation

struct LaunchViewModel {
    
    var launches: Launch
    
    var name: String {
        return launches.name
    }
}
