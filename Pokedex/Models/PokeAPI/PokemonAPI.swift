//
//  PokemonAPI.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

class PokemonAPI {
    
    private let cache = Cache()
    
    init() {
        print("PokemonAPI")
    }
    
    func pokemon(_ pokemon: PokemonData, completed: @escaping (Result<Pokemon, Error>) -> Void) {
        if let cachedPokemon: Pokemon = cache.load(pokemon) {
            completed(.success(cachedPokemon))
            return
        }
        
        guard let urlRequest: URLRequest = API.urlRequest(pokemon.url.absoluteString, httpMethod: .get) else {
            completed(.failure(ServerError.badRequest))
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let err = error {
                completed(.failure(err))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completed(.failure(ServerError.badRequest))
                return
            }
            
            guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                completed(.failure(ServerError.badRequest))
                return
            }
            
            do {
                try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                let poke = try JSONDecoder().decode(Pokemon.self, from: data!)
                
                self.cache.save(pokemon, data: data!)
                
                completed(.success(poke))
            } catch let jsonError {
                completed(.failure(jsonError))
            }
        }.resume()
    }
    
    func getPokemon(_ page: Int = 1, completed: @escaping (Result<[PokemonData], Error>) -> Void) {
        
        guard page >= 1 else {
            completed(.failure(ServerError.badRequest))
            return
        }
        
        let limit = 25
        let offset = limit * (page - 1)
        let url = "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=\(limit)"
                        
        guard let urlRequest: URLRequest = API.urlRequest(url, httpMethod: .get) else {
            completed(.failure(ServerError.badRequest))
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let err = error {
                completed(.failure(err))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completed(.failure(ServerError.badRequest))
                return
            }
            
            guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                completed(.failure(ServerError.badRequest))
                return
            }
            
            do {
                try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                let response = try JSONDecoder().decode(PokeResponse.self, from: data!)
                
                completed(.success(response.results))
            } catch let jsonError {
                completed(.failure(jsonError))
            }
        }.resume()
        
    }
}
