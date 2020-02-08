//
//  String+Random.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 23/01/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

extension String {
    
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
}
