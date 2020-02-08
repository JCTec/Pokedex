//
//  Cacheable.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

protocol Cacheable {
    func cacheKey() -> String
}
