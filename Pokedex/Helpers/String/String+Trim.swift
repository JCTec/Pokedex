//
//  String+Trim.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 03/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import Foundation

extension String {
    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
