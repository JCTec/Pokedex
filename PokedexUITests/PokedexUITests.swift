//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by Juan Carlos Estevez on 06/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import XCTest

class PokedexUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testALogin() {
        //Test should be performed with no user login scenario.
        let app = XCUIApplication()
        app.launch()

        let emailField = app.textFields["emailField"]
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: emailField, handler: nil)
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testBasics() {
        let app = XCUIApplication()
        app.launch()

        let emailField = app.textFields["emailField"]
        let passswordField = app.secureTextFields["passwordField"]
        let loginButton = app.buttons["login"]

        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: emailField, handler: nil)
        waitForExpectations(timeout: 5.0) { (error) in
            XCTAssertNil(error)
            
            emailField.tap()
            emailField.typeText("pokedex@pokemon.com")
            emailField.typeText("\n")

            passswordField.typeText("ILovePokemon")
            passswordField.typeText("\n")

            loginButton.tap()
            
            self.expectation(for: exists, evaluatedWith: app.staticTexts["pokedex"], handler: nil)
            self.waitForExpectations(timeout: 5.0)
            
            self.expectation(for: exists, evaluatedWith: app.staticTexts["bulbasaur"], handler: nil)
            self.waitForExpectations(timeout: 10.0)
        }
    }
    
}
