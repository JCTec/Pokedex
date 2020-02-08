//
//  PokeColors.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

class PokeColors {
    static let background: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    return PokeStaticColors.backgroundDark
                } else {
                    return PokeStaticColors.background
                }
            }
        } else {
            return PokeStaticColors.background
        }
    }()
    
    static let shadows: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    return .lightGray
                } else {
                    return .darkGray
                }
            }
        } else {
            return .darkGray
        }
    }()
}

class PokeStaticColors {
    static let background: UIColor = UIColor(hex: 0xd2def1)
    static let backgroundDark: UIColor = UIColor(hex: 0x001A1F)
    
    static let red: UIColor = UIColor(hex: 0xed1e24)
    static let green: UIColor = UIColor(hex: 0xb5dd03)
    static let yellow: UIColor = UIColor(hex: 0xffca39)
    
    struct Blue {
        static let light: UIColor = UIColor(hex: 0x4d65af)
        static let dark: UIColor = UIColor(hex: 0x2e439c)
        static let cyan: UIColor = UIColor(hex: 0x07fcfe)
        static let pokemon: UIColor = UIColor(hex: 0x2a5793)
    }
}
