//
//  UIViewController+Dismissable.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func makeDismissable(_ vc: UIGestureRecognizerDelegate) {
        navigationController?.interactivePopGestureRecognizer?.delegate = vc
    }

}
