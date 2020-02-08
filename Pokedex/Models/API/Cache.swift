//
//  Cache.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

class Cache {
    var storage = FileStorage()
    
    func load<A: Codable>(_ resource: Cacheable) -> A? {
        if let data = storage[resource.cacheKey()] {
            do {
                try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let response = try JSONDecoder().decode(A.self, from: data)
                
                return response
            } catch _ {
                return nil
            }
        }else {
            return nil
        }
    }
    
    func save(_ resource: Cacheable, data: Data) {
        storage[resource.cacheKey()] = data
    }
}
