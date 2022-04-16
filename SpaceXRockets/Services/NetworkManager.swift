//
//  NetworlManager.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import Foundation

class NetworkManager {
    
    let imageCache = NSCache<NSString, NSData>()
    static let shared = NetworkManager()
    
    init() {}
    
    func getRockets(completion: @escaping ([Rocket]?) -> Void) {
        let url = API.rockets.url
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error \(error?.localizedDescription) in URLSession ")
                completion(nil)
                return
            }
            guard let data = data else {
                print("error \(error)")
                completion(nil)
                return
            }
            
            do {
                let rocketPack = try? JSONDecoder().decode([Rocket].self, from: data)
                completion(rocketPack)
            } catch let error {
                print("error \(error) decoding data")
                completion(nil)
            }
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        
        guard let url = URL(string: urlString ) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    completion(nil)
                    return
                }
                guard let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
    
    func getLaunches(_ rocket: String, completion: @escaping([Launch]?) -> Void) {
        let url = API.launchec.url
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error \(error?.localizedDescription) in URLSession ")
                completion(nil)
                return
            }
            guard let data = data else {
                print("error \(error)")
                completion(nil)
                return
            }
            
            do {
                let launchPack = try? JSONDecoder().decode([Launch].self, from: data)
                completion(launchPack?.filter{ $0.rocket == rocket })
            } catch let error {
                print("error \(error) decoding data")
                completion(nil)
            }
        }.resume()
    }
}

