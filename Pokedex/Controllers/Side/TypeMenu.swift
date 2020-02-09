//
//  TypeMenu.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 15/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

// MARK: - MenuController
struct MenuController {
    let image: UIImage?
    let name: String!
    
    init(image: UIImage, name: String) {
        self.image = image
        self.name = name
    }
    
    init(name: String) {
        self.image = nil
        self.name = name
    }
}

// MARK: - TypeMenu
enum TypeMenu {
    case home

    case logout
    
    func segue() -> String {
        switch self {
            case .home:
                return "homeSegue"

            case .logout:
                return "logoutSegue"
        }
    }

    func toString() -> String {
        switch self {
            case .home:
                return "Home".localized

            case .logout:
                return "Logout".localized
        }
    }
    
    func info() -> MenuController {
        switch self {
            case .home:
                return MenuController(image: #imageLiteral(resourceName: "home"), name: toString())
            
            case .logout:
                return MenuController(name: toString())
        }
    }
    
    static func index(_ index: IndexPath) -> TypeMenu {
        
        if index.section == 0 {
            if index.row == 0 {
                return .home
            }else {
                fatalError("Only \(TypeMenu.count(for: index.section)) menus. Index out of range")
            }
        }else if index.section == 1 {
            if index.row == 0 {
                return .logout
            }else {
                fatalError("Only \(TypeMenu.count(for: index.section)) menus. Index out of range")
            }
        }else {
            fatalError("Only \(TypeMenu.sections()) sections. Index out of range")
        }
    }
    
    static func count(for section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            fatalError("Only \(TypeMenu.sections()) sections. Index out of range")
        }
    }
    
    static func sections() -> Int {
        return 2
    }
    
    static func count() -> Int {
        return 2
    }
    
    static func segues() -> [String] {
        return [TypeMenu.home.segue(), TypeMenu.logout.segue()]
    }
}
