//
//  HTTPMethod.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    
    func toString() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
