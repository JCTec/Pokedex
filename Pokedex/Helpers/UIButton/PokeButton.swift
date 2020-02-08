//
//  PokeButton.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

class PokeButton: LoadingButton {
    
    override func awakeFromNib() {
        backgroundColor = PokeStaticColors.yellow
        layer.cornerRadius = 8.0
        layer.borderWidth = 2.0
        layer.borderColor = PokeStaticColors.Blue.pokemon.cgColor
    }
    
    func setPokeTitle(_ title: String) {
        let mutableStr = NSMutableAttributedString(string: title, attributes: [
            NSAttributedString.Key.font: PokeFont.regular.font(size: 15.0),
            NSAttributedString.Key.foregroundColor: PokeStaticColors.Blue.pokemon
        ])
        
        titleLabel?.attributedText = mutableStr
        setTitleColor(PokeStaticColors.Blue.pokemon, for: .normal)
    }
}
