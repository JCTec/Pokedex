//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 07/02/20.
//  Copyright © 2020 Juan Carlos Estevez. All rights reserved.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var pokemons: [PokemonData] = [PokemonData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavbar("pokedex")
        setUp()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setRoot()
        load()
        
    }
    
    private func load() {
        API.pokemon.getPokemon { (result) in
            switch result {
                case .success(let pokemonData):
                    print(pokemonData)
                    
                    self.pokemons = pokemonData
                    
                    DispatchQueue.main.async {
                        self.loading.stopAnimating()
                        self.collectionView.reloadData()
                    }
                    
                case .failure(let error):
                    #if DEBUG
                        print(error)
                    #endif
                
                    DispatchQueue.main.async {
                        self.loading.stopAnimating()
                    }
            }
        }
    }
    
    private func setUp() {
        showNavigationBar()
        
        view.backgroundColor = PokeColors.background
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isSkeletonable = true
    }

}

// MARK: - UICollectionViewDelegate
extension HomeViewController: SkeletonCollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return PokeCollectionViewCell.identifier
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeCollectionViewCell.identifier, for: indexPath) as? PokeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.pokeData = pokemons[indexPath.row]

        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 185.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 20, right: 0)
    }
}
