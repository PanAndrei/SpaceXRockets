//
//  RocketsPackViewModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import Foundation

class RocketsPackViewModel {
    var rocketPack = [RocketViewModel]()
    
    func getRockets(completion: @escaping ([RocketViewModel]) -> Void) {
        NetworkManager.shared.getRockets { (rockets) in
            guard let rockets = rockets else {
                return
            }
            
            let rocketPack = rockets.map(RocketViewModel.init)
            DispatchQueue.main.async {
                self.rocketPack = rocketPack
                completion(rocketPack)
            }
        }
    }
}
