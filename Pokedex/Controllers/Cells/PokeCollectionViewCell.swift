//
//  PokeCollectionViewCell.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 08/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import UIKit
import SkeletonView

protocol PokeCollectionViewCellDelegate: class {
    func didSelect(_ pokemon: Pokemon)
}

class PokeCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "pokeCell"
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightTitleLabel: UILabel!
    @IBOutlet weak var weightTitleLabel: UILabel!
    
    @IBOutlet weak var pokeNameLabel: UILabel!
    
    weak var delegate: PokeCollectionViewCellDelegate?
    
    private let gradient = SkeletonGradient(baseColor: PokeStaticColors.red)
    private var pokemon: Pokemon?

    var pokeData: PokemonData! {
        didSet {
            pokeNameLabel.text = pokeData.name
            pokemon = nil
            loadDataWith(pokeData)
        }
    }
    
    override func awakeFromNib() {
        imageView.isSkeletonable = true
        weightLabel.isSkeletonable = true
        heightLabel.isSkeletonable = true
        heightTitleLabel.isSkeletonable = true
        weightTitleLabel.isSkeletonable = true
        
        imageView.layer.cornerRadius = 8.0
        weightLabel.layer.cornerRadius = 8.0
        heightLabel.layer.cornerRadius = 8.0
        heightTitleLabel.layer.cornerRadius = 8.0
        weightTitleLabel.layer.cornerRadius = 8.0
        
        weightLabel.layer.masksToBounds = true
        heightLabel.layer.masksToBounds = true
        heightTitleLabel.layer.masksToBounds = true
        weightTitleLabel.layer.masksToBounds = true

        backView.layer.cornerRadius = 8.0
        backView.backgroundColor = PokeStaticColors.red
        
        weightLabel.font = PokeFont.regular.font(size: 16.0)
        heightLabel.font = PokeFont.regular.font(size: 16.0)

        heightTitleLabel.font = PokeFont.regular.font(size: 12.0)
        weightTitleLabel.font = PokeFont.regular.font(size: 12.0)
        
        weightLabel.textColor = .white
        heightLabel.textColor = .white
        heightTitleLabel.textColor = .white
        weightTitleLabel.textColor = .white

        pokeNameLabel.font = PokeFont.regular.font(size: 22.0)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didSelectView))
        tap.cancelsTouchesInView = true
        
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(tap)
        
        PokeShadows.setShadow(to: backView)
    }
    
    private func startAnimatingSkeleton() {
        imageView.showAnimatedGradientSkeleton(usingGradient: gradient)
        weightLabel.showAnimatedGradientSkeleton(usingGradient: gradient)
        heightLabel.showAnimatedGradientSkeleton(usingGradient: gradient)
        heightTitleLabel.showAnimatedGradientSkeleton(usingGradient: gradient)
        weightTitleLabel.showAnimatedGradientSkeleton(usingGradient: gradient)
    }
    
    @objc private func didSelectView() {
        if let pokemon = self.pokemon {
            delegate?.didSelect(pokemon)
        }
    }
    
    private func stopAnimatingSkeleton() {
        imageView.hideSkeleton()
        weightLabel.hideSkeleton()
        heightLabel.hideSkeleton()
        heightTitleLabel.hideSkeleton()
        weightTitleLabel.hideSkeleton()
    }
    
    private func loadDataWith(_ pokeData: PokemonData) {
        startAnimatingSkeleton()
        
        API.pokemon.pokemon(pokeData) { (result) in
            switch result {
                case .success(let pokemon):
                    DispatchQueue.main.async {
                        self.stopAnimatingSkeleton()
                        self.setInfoWith(pokemon)
                    }
                            
                case .failure(let error):
                    #if DEBUG
                        print(error)
                    #endif
            }
        }
    }
    
    private func setInfoWith(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        pokeNameLabel.text = pokemon.name
        
        weightLabel.text = "\(pokemon.weight) Kg"
        heightLabel.text = "\(pokemon.height) m"
        
        guard let url = URL(string: pokemon.sprites.frontDefault) else { return }
    
        setImageTo(imageView, with: url)
    }
}
