//
//  Navbar.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
        
    func setMenu() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = PokeStaticColors.red
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        PokeShadows.setShadowTo(navBar: navigationController!.navigationBar)
    }
    
    func setLeftBarItem() {
        let left = #imageLiteral(resourceName: "Menu").resized(toWidth: 25.0)?.withRenderingMode(.alwaysOriginal)
        let leftButton = UIBarButtonItem(image: left, style: .plain, target: self, action: #selector(self.menu))
        leftButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func setBackMenu() {
        let left = #imageLiteral(resourceName: "left").resized(toWidth: 25.0)?.withRenderingMode(.alwaysOriginal)
        let leftButton = UIBarButtonItem(image: left, style: .plain, target: self, action: #selector(self.popMe))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func configureNavbar(_ title: String, noMenu: Bool = false) {
        setMenu()
        
        if !noMenu {
            setLeftBarItem()
        }else {
            setBackMenu()
        }
        
        for view in navigationController?.navigationBar.subviews ?? [UIView]() where view.accessibilityIdentifier == "rightNavImageView"{
            view.removeFromSuperview()
        }
        
        let attributedString = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.font: PokeFont.regular.font(size: 15.0),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ])
                
        let label = UILabel()
        label.attributedText = attributedString
        
        let rightButton = UIBarButtonItem(customView: label)
            
        navigationItem.rightBarButtonItem = rightButton
        
        if !noMenu {
            addPanGesture()
        }
    }
    
    func addPanGesture() {
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(menu))
        gesture.edges = .left
        
        view.addGestureRecognizer(gesture)
    }
    
    @objc func menu() {
        if let menu = self as? SideMenuDelegate {
            SideMenuHelper.shared.setDelegate(menu)
        }
        
        performSegue(withIdentifier: "menuSegue", sender: nil)
    }
    
    @objc func popMe() {
        popViewController(animated: true)
    }
    
}
