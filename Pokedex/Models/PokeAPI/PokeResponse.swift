//
//  PokeResponse.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

// MARK: - PokeResponse
struct PokeResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonData]
}

// MARK: - Result
struct PokemonData: Codable {
    let name: String
    let url: URL
    
    func id() -> Int {
        return url.absoluteString.lastdigit()
    }
}

extension PokemonData: Cacheable {
    func cacheKey() -> String {
        return "Cache:\(url.absoluteString.sha1())"
    }
}
