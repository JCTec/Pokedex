//
//  LoginViewController.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import UIKit
import ViewAnimator

class LoginViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var pokedexView: UIImageView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: PokeButton!
    
    @IBOutlet weak var emailSelector: UIImageView!
    @IBOutlet weak var passwordSelector: UIImageView!
    
    private let homeSegue: String = "homeSegue"
    private let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
    private let up = [AnimationType.from(direction: .top, offset: 30.0)]

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setRoot()
        animate()
    }
    
    private func animate() {
        UIView.animate(views: [pokedexView, emailField, passwordField, loginButton, emailSelector], animations: animations, duration: 1.4, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: [.curveEaseIn])
        UIView.animate(views: [logoView], animations: up)
    }
    
    private func setUp() {
        view.backgroundColor = PokeColors.background
        
        emailField.accessibilityIdentifier = "emailField"
        passwordField.accessibilityIdentifier = "passwordField"
        loginButton.accessibilityIdentifier = "login"
        
        emailField.pokeField("Email")
        passwordField.pokeField("Password")
        
        emailField.delegate = self
        passwordField.delegate = self

        loginButton.setPokeTitle("Login")
        
        passwordSelector.isHidden = true
    }
    
    private func email() -> String {
        return emailField.text?.trim() ?? ""
    }
    
    private func password() -> String {
        return passwordField.text?.trim() ?? ""
    }
    
    private func isValid() -> Bool {
        
        if email().isEmpty {
            emailField.shake()
            return false
        }
        
        if password().isEmpty {
            passwordField.shake()
            return false
        }
        
        return true
    }
    
    @IBAction func didSelectLogin(_ sender: Any) {
        if isValid() {
            loginButton.showLoading()
            
            API.user.login(email: email(), password: password()) { (result) in
                switch result {
                    case .success(let user):
                        print(user)
                        //Simula carga al servidor.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            self.loginButton.hideLoading()
                            
                            self.homeSegue.performSegue(on: self)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.loginButton.hideLoading()
                            
                            if case CredentialsError.wrongEmail = error {
                                self.emailField.shake()
                            }else if case CredentialsError.wrongPassword = error {
                                self.passwordField.shake()
                            }
                        }
                        
                        #if DEBUG
                            print(error)
                        #endif
                }
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            passwordField.becomeFirstResponder()
        }else {
            dismissKeyboard()
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            emailSelector.isHidden = false
            passwordSelector.isHidden = true
        }else {
            emailSelector.isHidden = true
            passwordSelector.isHidden = false
        }
    }
    
}
