//
//  MainViewController.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    let favoritesView = FavoritesView()
    
    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        favoritesView.favoriteCollectionView.delegate = self
        favoritesView.favoriteCollectionView.dataSource = self
    }
    

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.size
        
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource {
    
}
