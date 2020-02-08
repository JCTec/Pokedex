//
//  UIViewController+SetRoot.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Prevents Memory Leaks
    func setRoot() {
        DispatchQueue.main.async {
            self.navigationController?.setViewControllers([self], animated: false)
        }
    }
    
}
