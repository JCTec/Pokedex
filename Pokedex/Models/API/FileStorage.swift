//
//  FileStorage.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 08/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

struct FileStorage {
    var baseURL: URL!
    
    init() {
        baseURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }

    subscript(key: String) -> Data? {
        get {
            let url = baseURL.appendingPathComponent(key)
            return try? Data(contentsOf: url)
        }
        set {
            let url = baseURL.appendingPathComponent(key)
            _ = try? newValue?.write(to: url)
        }
    }
}
