//
//  String+Localized.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 02/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(withComment: String) -> String {
        let localizedString = NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "Any Comment")
        let wantedString = String(format: localizedString, withComment)
        return wantedString
    }
}
