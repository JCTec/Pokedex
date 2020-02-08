//
//  String+PerformSegue.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 04/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /// This function lets you easily perform a segue in a given UIViewController
    ///
    /// Usage:
    ///
    ///     "SegueName".performSegue(on: self)
    ///
    /// - Parameter view: The ViewController to perform the segue on.
    func performSegue(on view: UIViewController) {
        if view.canPerformSegue(withIdentifier: self) {
            DispatchQueue.main.async {
                view.performSegue(withIdentifier: self, sender: nil)
            }
        }
    }
    
}
