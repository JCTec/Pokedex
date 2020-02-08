//
//  String+LastDigit.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 08/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation

extension String {
    
    func lastdigit() -> Int {
        let strToUse = String(dropLast())
        var count = 0
        
        for item in strToUse.reversed() {
            if item != "/"{
                count += 1
            }else {
                break
            }
        }
        
        return Int(String(strToUse.suffix(count))) ?? 0
    }
    
}
