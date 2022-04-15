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
    
    var date: String {
        return launches.date_utc.getFormattedDateString(oldFormat: "yyyy-MM-dd'T'HH:mm:ss.sssZ", newFormat: "d MMMM, yyyy")
    }
    
    // force unwrap
    var picture: String {
        return launches.success! ? Pictures.success.rawValue : Pictures.failure.rawValue
    }
}
