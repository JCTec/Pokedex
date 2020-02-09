//
//  SideMenuConfigCollectionViewCell.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 16/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import UIKit

class SideMenuConfigCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "configCell"

    @IBOutlet weak var label: UILabel!
    
    var type: TypeMenu! {
        didSet {
            label.text = type.info().name.lowercased()
        }
    }
    
    override func awakeFromNib() {
        label.font = PokeFont.regular.font(size: 15.0)
        label.textColor = .black
    }
}
