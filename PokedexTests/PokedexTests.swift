//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokedexTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPokeAPI() {
        let pokeAPI = PokemonAPI()
        
        pokeAPI.getPokemon { (result) in
            switch result {
            case .success(let pokeData):
                XCTAssert(!pokeData.isEmpty)
            case .failure(_):
                XCTAssert(false)
            }
        }
    }

    func testLogin() {
        let userAPI = UserAPI()
        userAPI.logout()

        XCTAssert(!userAPI.isLoggedIn())
        
        userAPI.login(email: "thisIsAWrongEmail@Wrong.com", password: "wrongPassword") { (result) in
            switch result {
            case .success(_):
                XCTAssert(false)
            case .failure(let error):
                if let ce = error as? CredentialsError {
                    XCTAssertEqual(ce, CredentialsError.wrongEmail)
                    
                    userAPI.login(email: "pokedex@pokemon.com", password: "wrongPassword") { (result) in
                        switch result {
                        case .success(_):
                            XCTAssert(false)
                        case .failure(let error):
                            if let ce = error as? CredentialsError {
                                XCTAssertEqual(ce, CredentialsError.wrongPassword)
                                
                                userAPI.login(email: "pokedex@pokemon.com", password: "ILovePokemon") { (result) in
                                    switch result {
                                    case .success(let user):
                                        XCTAssertEqual(user.email, "pokedex@pokemon.com")
                                    case .failure(_):
                                        XCTAssert(false)
                                    }
                                }
                                
                            }else {
                                XCTAssert(false)
                            }
                        }
                    }
                    
                }else {
                    XCTAssert(false)
                }
            }
        }
    }


}
