//
//  UsersAPI.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class UserAPI {
    static let userID = "UserID"

    private var user: User?
    
    init() {
        print("UserAPI")
        load()
    }
    
    private func load() {
        if KeychainWrapper.standard.hasValue(forKey: UserAPI.userID) {
            guard let data = KeychainWrapper.standard.data(forKey: UserAPI.userID) else {
                return
            }
            
            do {
                try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                user = try JSONDecoder().decode(User.self, from: data)
            } catch {
                print("Error Parsing Token")
            }
            
        }
    }
    
    private func saveUser(data: Data) {
        KeychainWrapper.standard.set(data, forKey: UserAPI.userID)
    }
    
    func current() -> User? {
        return user
    }
    
    func isLoggedIn() -> Bool {
        return user != nil
    }
    
    func login(email: String, password: String, completed: @escaping (Result<User, Error>) -> Void) {
        
        if email == staticEmail {
            if password == staticPassword {
                let user = User(name: "Pokedex User", email: email, profilePicture: "https://picsum.photos/200/200")
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(user) {
                    saveUser(data: encoded)
                    self.user = user
                    completed(.success(user))
                }
            }else {
                completed(.failure(CredentialsError.wrongPassword))
            }
        }else {
            completed(.failure(CredentialsError.wrongEmail))
        }
        
    }
    
    func logout() {
        user = nil
        KeychainWrapper.standard.removeAllKeys()
    }
}
