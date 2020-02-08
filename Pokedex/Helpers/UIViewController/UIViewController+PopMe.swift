//
//  UIViewController+PopMe.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func popViewController(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
}
