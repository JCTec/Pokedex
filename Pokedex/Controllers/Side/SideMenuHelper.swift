//
//  SideMenuHelper.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 16/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import Foundation

class SideMenuHelper {
    static let shared: SideMenuHelper = SideMenuHelper()
    
    private init() {
        print("SideMenuHelper")
    }
    
    var currentMenu: TypeMenu = .home
    weak var delegate: SideMenuDelegate?
    
    func hasNewDelegate() -> Bool {
        return delegate != nil ? true : false
    }
    
    func setDelegate(_ delegate: SideMenuDelegate?) {
        self.delegate = nil
        self.delegate = delegate
    }
    
    func getDelegate() -> SideMenuDelegate? {
        let d = self.delegate
        self.delegate = nil
        return d
    }
    
}
