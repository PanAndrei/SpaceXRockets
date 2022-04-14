//
//  LaunchPackViewModel.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 14.04.2022.
//

import Foundation

class LaunchPackViewModel {
    var launchPack = [LaunchViewModel]()
    
    func getLaunch(completion: @escaping ([LaunchViewModel]) -> Void) {
        NetworkManager.shared.getLaunches { (launch) in
            guard let launch = launch else {
                return
            }
            
            let launchPack = launch.map(LaunchViewModel.init)
            DispatchQueue.main.async {
                self.launchPack = launchPack
                completion(launchPack)
            }
        }
    }
}

