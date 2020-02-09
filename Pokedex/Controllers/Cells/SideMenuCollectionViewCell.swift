//
//  SideMenuCollectionViewCell.swift
//  Xplain
//
//  Created by Juan Carlos Estevez on 15/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import UIKit

class SideMenuCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "menuCell"
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        backView.layer.cornerRadius = 8.0
        label.textColor = .black
        label.font = PokeFont.regular.font(size: 16.0)
    }
    
    var selectedMenu: TypeMenu!
    
    var type: TypeMenu! {
        didSet {
            let info = type.info()
            
            imageView.image = info.image
            label.text = info.name.lowercased()
            
            if selectedMenu == type {
                backView.backgroundColor = .white
                imageView.tintColor = PokeStaticColors.red
                label.textColor = .black
            } else {
                backView.backgroundColor = .clear
                imageView.tintColor = .white
                label.textColor = .white
            }
        }
    }
    
}
