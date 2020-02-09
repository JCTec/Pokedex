//
//  CredentialsError.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 09/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

enum CredentialsError: Error {
    case wrongEmail
    case wrongPassword

    func description() -> String {
        switch self {
            case .wrongEmail:
                return "The Email provided is not correct"
            case .wrongPassword:
                return "The Password provided does not match the correct one."
        }
    }
}
