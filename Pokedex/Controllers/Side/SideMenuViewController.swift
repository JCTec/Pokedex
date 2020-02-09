//
//  SideMenuViewController.swift
//  Pokedex
//
//  Created by Juan Carlos Estevez on 15/12/19.
//  Copyright © 2019 Juan Carlos Estevez. All rights reserved.
//

import UIKit

protocol SideMenuDelegate: class {
    func didSelect(type: TypeMenu)
}

class SideMenuViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if SideMenuHelper.shared.hasNewDelegate() {
            delegate = SideMenuHelper.shared.getDelegate()
        }
    }
    
    // MARK: - Private Functions
    private func setUp() {
        hideNavigationBar()

        view.backgroundColor = PokeStaticColors.red
        
        profilePicture.image = #imageLiteral(resourceName: "pickachu")
        profilePicture.layer.cornerRadius = 45
        
        nameLabel.font = PokeFont.regular.font(size: 18)
        
        nameLabel.textColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let user = API.user.current()
                    
        nameLabel.text = user?.name.lowercased() ?? "pikachu"
        
        if let url = URL(string: user?.profilePicture ?? "") {
            setImageTo(profilePicture, with: url)
        }
    }

}

// MARK: - UICollectionViewDelegate
extension SideMenuViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return TypeMenu.sections()
    }
    
}

// MARK: - UICollectionViewDataSource
extension SideMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let type = TypeMenu.index(indexPath)
        
        if type != SideMenuHelper.shared.currentMenu {
            delegate?.didSelect(type: type)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TypeMenu.count(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SideMenuHeaderCollectionReusableView.identifier, for: indexPath) as? SideMenuHeaderCollectionReusableView else { return UICollectionReusableView() }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SideMenuCollectionViewCell.identifier, for: indexPath) as? SideMenuCollectionViewCell else { return UICollectionViewCell() }
            
            cell.selectedMenu = SideMenuHelper.shared.currentMenu
            cell.type = TypeMenu.index(indexPath)
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SideMenuConfigCollectionViewCell.identifier, for: indexPath) as? SideMenuConfigCollectionViewCell else { return UICollectionViewCell() }
            
            cell.type = TypeMenu.index(indexPath)
            
            return cell
        }
    }
    
}

// MARK: - UICollectionViewDelegate
extension SideMenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60.0)
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
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 10, right: 0)
    }
}
