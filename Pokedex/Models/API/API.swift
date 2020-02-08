//
//  API.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

class API {
    static let user: UserAPI = UserAPI()
    static let pokemon: PokemonAPI = PokemonAPI()

    static func urlRequest(_ url: String, httpMethod: HTTPMethod, parameters: [String: String]? = nil) -> URLRequest? {
        
        guard let urlToUse = URL(string: url) else { return nil }
        
        var urlRequest = URLRequest(url: urlToUse, cachePolicy:
            .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30.0)
        
        urlRequest.httpMethod = httpMethod.toString()
        
        if httpMethod == .post {
            urlRequest.httpBody = parameters?.percentEscaped().data(using: .utf8)
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
}
