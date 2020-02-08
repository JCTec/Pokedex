//
//  ServerError.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

enum ServerError: Error {
    case notFound
    case badRequest
    case unauthorized

    func description() -> String {
        switch self {
            case .notFound:
                return "Not Found"
            case .badRequest:
                return "Bad Request"
            case .unauthorized:
                return "Unauthorized"
        }
    }
}
