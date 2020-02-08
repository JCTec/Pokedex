//
//  UIViewController+SetImage.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setImageTo(_ imageView: UIImageView, with url: URL!) {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.large

        imageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "pokemon"), options: .highPriority) { (image, error, _, url) in
            
            if error == nil {
                imageView.image = image
                
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFill
            } else {
                print(error ?? "No Error in Image from URL: \(url!)")

                imageView.image = #imageLiteral(resourceName: "pokemon")
                
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFill
            }
        }
        
    }
    
}

extension UICollectionReusableView {
    
    func setImageTo(_ imageView: UIImageView, with url: URL!) {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.large
        
        imageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "pokemon"), options: .highPriority) { (image, error, _, url) in
            
            if error == nil {
                imageView.image = image
                
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFill
            } else {
                print(error ?? "No Error in Image from URL: \(url!)")

                imageView.image = #imageLiteral(resourceName: "pokemon")
                
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFill
            }
        }
        
    }
    
}
