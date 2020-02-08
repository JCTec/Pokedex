//
//  LoadingButton.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

class LoadingButton: UIButton {
    
    var activityIndicator: UIActivityIndicatorView!
    var text: String?
    
    func showLoading() {
        if text == nil {
            text = titleLabel?.text
            setTitle("", for: .normal)
        }
        
        if activityIndicator == nil {
            activityIndicator = createActivityIndicator()
        }
        
        showSpinning()
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.setTitle(self.text, for: .normal)
            self.text = nil
            
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        addConstraint(yCenterConstraint)
    }
}
