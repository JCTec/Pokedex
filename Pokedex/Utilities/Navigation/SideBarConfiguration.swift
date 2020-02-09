//
//  SideBarConfiguration.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 09/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import SideMenu

extension UIViewController {
    func pokeSideMenu(_ menu: UIViewController) {
        if let vc = menu as? SideMenuNavigationController {
            let presentation = SideMenuPresentationStyle.viewSlideOutMenuIn
            presentation.menuStartAlpha = 0.5
            presentation.presentingEndAlpha = 0.5
            
            vc.presentationStyle = presentation
        }
    }
}
