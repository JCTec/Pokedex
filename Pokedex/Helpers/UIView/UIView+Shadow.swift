//
//  UIView+Shadow.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    /**
     Set a shadow on a UIView.
     - parameters:
        - color: Shadow color, defaults to black
        - opacity: Shadow opacity, defaults to 1.0
        - offset: Shadow offset, defaults to zero
        - radius: Shadow radius, defaults to 0
        - viewCornerRadius: If the UIView has a corner radius this must be set to match
    */
    func setShadow(with color: UIColor?, opacity: Float?, offset: CGSize?, radius: CGFloat, viewCornerRadius: CGFloat?) {
        layer.masksToBounds = false
        layer.shadowColor = color?.cgColor ?? UIColor.black.cgColor
        layer.shadowOpacity = opacity ?? 1.0
        layer.shadowOffset = offset ?? CGSize.zero
        layer.shadowRadius = radius
    }
    
    func removeShadow() {
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0.0
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 0.0
    }
    
}
