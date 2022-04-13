//
//  RocketViewModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import Foundation

let defaults = UserDefaults.standard

struct RocketViewModel {
    
    var rockets: Rocket
    let defaults = UserDefaults.standard

    // MARK: - imageview

    var name: String? {
        return rockets.name
    }
    
    var id: String? {
        return rockets.id
    }
    
    var imageURL: String? {
       return rockets.flickr_images.randomElement()!
    }
    
    // MARK: - Cell

    // хитрая строка с разным шрифтом
    
    var heighValue: [String]? {
        
        switch defaults.integer(forKey: Settings.heigh.rawValue) {
        case 0:
            return [String(rockets.height.meters!), "высота, m"]
        default:
            return [String(rockets.height.feet!), "высота, ft"]
        }
    }
    
    var diameterValue: [String]? {
        switch defaults.integer(forKey: Settings.diameter.rawValue) {
        case 0:
            return [String(rockets.diameter.meters!), "диаметр, m"]
        default:
            return [String(rockets.diameter.feet!), "диаметр, ft"]
        }
        // swith
//        return [String(rockets.diameter.meters!), "диаметр, m"]
    }
    
    var massValue: [String]? {
        
        switch defaults.integer(forKey: Settings.weight.rawValue) {
        case 0:
            return [String(rockets.mass.kg!), "масса, kg"]
        default:
            return [String(rockets.mass.lb!), "масса, lb"]
        }
        
        // swith
//        return [String(rockets.mass.kg!), "масса, kg"]
    }
    
    var payloadValue: [String]? {
        let payload = rockets.payload_weights.filter { $0.id == "leo"}.first!
        
        switch defaults.integer(forKey: Settings.payload.rawValue) {
        case 0:
            return [String(payload.kg!), "масса, kg"]
        default:
            return [String(payload.lb!), "масса, lb"]
        }
        
//        return [String(payload.kg!), "масса, kg"]
    }
    
    // MARK: - Info

    var firstFlight: String? {
        return rockets.first_flight
    }
    
    var country: String? {
        return rockets.country
    }
    
    var costPerLaunch: String? {
        return String(rockets.cost_per_launch)
    }
    //force
    var firstStageEng: String? {
        return String(rockets.first_stage.engines!)
    }
    
    var firstStageFuel: String? {
        return String(rockets.first_stage.fuel_amount_tons!)
    }
    
    // nill !!!!
    var firstStageBurnTime: String? {
        if let time = rockets.first_stage.burn_time_sec {
            return String(time)
        } else {
            return "нет данных"
        }
    }
    
    var secondStageEng: String? {
        return String(rockets.second_stage.engines!)
    }
    
    var secondStageFuel: String {
        return String(rockets.second_stage.fuel_amount_tons!)
    }
    
    var secondStageBurnTime: String {
        if let time = rockets.second_stage.burn_time_sec {
            return String(time)
        } else {
            return "нет данных"
        }
    }
    
    
}

