//
//  String+LoadNib.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 17/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /// Carga un Archivo Nib con el nombre de la cadena de texto.
    ///
    /// - Parameter bundle: Bundle a agregar.
    /// - Returns: UINib.
    func loadNib(bundle: Bundle? = nil) -> UINib? {
        return UINib(nibName: self, bundle: bundle)
    }
}
