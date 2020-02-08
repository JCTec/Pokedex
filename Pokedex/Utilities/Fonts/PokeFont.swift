//
//  PokeFont.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

enum PokeFont {
    case regular

    func familyName() -> String {
        return "Pokemon GB"
    }
    
    func fontName() -> String {
        switch self {
        case .regular:
            return "PokemonGB"
        }
    }

    func font(size: CGFloat) -> UIFont {
        //Estas lineas te permiten tener fonts variables que el usuario en un futuro puede agrandar o bajar.
        
        let plus = CGFloat(UserDefaults.standard.float(forKey: "plusFontSize"))
        
        guard let fontToUse = UIFont(name: fontName(), size: size + plus) else { return UIFont.systemFont(ofSize: size) }
        
        return fontToUse
    }
}
