//
//  Enums.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 13.04.2022.
//

import Foundation

enum Settings: String {
    case heigh = "heigh"
    case diameter = "diameter"
    case weight = "weight"
    case payload = "payload"
}

enum Keys: String {
    case notificationUpdade = "reloadView"
    case cellIdentifier = "cell"
}

enum Pictures: String {
    case success = "image1"
    case failure = "image2"
    case settings = "image3"
    case noConnection = "antenna.radiowaves.left.and.right.slash"
}
