//
//  SessionViewController.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import UIKit
import Lottie

class SessionViewController: UIViewController {
    private let loginSegue: String = "loginSegue"
    private var homeSegue: String = "homeSegue"
    
    @IBOutlet weak var animationView: AnimationView!
    
    var navigationBarFix: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationView.play()
        setRoot()
        load()
        hideNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if navigationBarFix {
            hideNavigationBar(animated: true)
        }
    }
    
    func load() {
        if API.user.isLoggedIn() {
            //This asyncAfter is to simulate dataload.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.homeSegue.performSegue(on: self)
            }
        }else {
            //This asyncAfter is to simulate dataload.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.loginSegue.performSegue(on: self)
            }
        }
    }
    
    private func setUp() {
        view.backgroundColor = PokeColors.background

        animationView.animation = Animation.named("loading")
        animationView.loopMode = .loop
    }
}
