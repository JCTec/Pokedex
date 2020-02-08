//
//  UITextField+PokeField.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func pokeField(_ title: String) {
        backgroundColor = .white
        textColor = .black
        
        let mutableStr = NSMutableAttributedString(string: title.lowercased(), attributes: [
            NSAttributedString.Key.font: PokeFont.regular.font(size: 12.0),
            NSAttributedString.Key.foregroundColor: PokeStaticColors.Blue.pokemon
        ])
        
        attributedPlaceholder = mutableStr

    }
    
}
