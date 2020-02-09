//
//  SideMenuHeaderCollectionReusableView.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 09/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

class SideMenuHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier: String = "sideHeader"
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        backView.backgroundColor = .white
    }
}
