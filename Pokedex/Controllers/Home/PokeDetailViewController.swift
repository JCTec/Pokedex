//
//  PokeDetailViewController.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 08/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import UIKit

class PokeDetailViewController: UIViewController {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightTitleLabel: UILabel!
    @IBOutlet weak var heightTitleLabel: UILabel!
    @IBOutlet weak var typeTitleLabel: UILabel!
    @IBOutlet weak var speciesTitleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        makeDismissable(self)
        
        configureNavbar(pokemon.name, noMenu: true)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Functions
    private func setUp() {
        view.backgroundColor = PokeStaticColors.red
        
        nameLabel.font = PokeFont.regular.font(size: 30.0)
        
        weightLabel.font = PokeFont.regular.font(size: 17.0)
        heightLabel.font = PokeFont.regular.font(size: 17.0)
        speciesLabel.font = PokeFont.regular.font(size: 17.0)
        typeLabel.font = PokeFont.regular.font(size: 17.0)

        weightTitleLabel.font = PokeFont.regular.font(size: 16.0)
        heightTitleLabel.font = PokeFont.regular.font(size: 16.0)
        typeTitleLabel.font = PokeFont.regular.font(size: 16.0)
        speciesTitleLabel.font = PokeFont.regular.font(size: 16.0)
        
        nameLabel.textColor = .white
        
        weightLabel.textColor = .white
        heightLabel.textColor = .white
        speciesLabel.textColor = .white
        typeLabel.textColor = .white

        weightTitleLabel.textColor = .white
        heightTitleLabel.textColor = .white
        typeTitleLabel.textColor = .white
        speciesTitleLabel.textColor = .white
        
        guard pokemon != nil else { return }
        
        setInfoWith(pokemon)
    }
    
    private func setInfoWith(_ pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        
        weightLabel.text = "\(pokemon.weight) Kg"
        heightLabel.text = "\(pokemon.height) m"
        
        speciesLabel.text = pokemon.species.name
        typeLabel.text = pokemon.types.allTypes()
        
        guard let url = URL(string: pokemon.sprites.frontDefault) else { return }
        
        setImageTo(pokemonImage, with: url)
    }
}

// MARK: - UIGestureRecognizerDelegate
extension PokeDetailViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
