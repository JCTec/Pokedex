//
//  PokeShadows.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

class PokeShadows {
    static func setShadow(to view: UIView, multiplier: Double = 1.0) {
        view.setShadow(with: shadowColor, opacity: opacity * Float(multiplier), offset: ofset, radius: radius * CGFloat(multiplier), viewCornerRadius: 0.0)
    }
    
    static func removeShadow(to view: UIView) {
        view.removeShadow()
    }
    
    static func setRightShadow(to view: UIView, multiplier: Double = 1.0) {
        view.setShadow(with: shadowColor, opacity: opacity * Float(multiplier), offset: CGSize(width: 10.0, height: 3.0), radius: radius * CGFloat(multiplier), viewCornerRadius: 0.0)
    }
    
    static func setTopShadow(to view: UIView, multiplier: Double = 1.0) {
        view.setShadow(with: shadowColor, opacity: 0.9 * Float(multiplier), offset: CGSize(width: 0.0, height: -5.0), radius: 35.0, viewCornerRadius: 0.0)
    }
    
    static func setShadowTo(navBar: UIView) {
        navBar.setShadow(with: shadowColor, opacity: 0.4, offset: CGSize(width: 0.0, height: 4.0), radius: 8.0, viewCornerRadius: 0.0)
    }
    
    static func setShadowTo(view: UIView) {
        view.setShadow(with: shadowColor, opacity: opacity, offset: CGSize(width: -2.0, height: 0.0), radius: radius, viewCornerRadius: 0.0)
    }
}
