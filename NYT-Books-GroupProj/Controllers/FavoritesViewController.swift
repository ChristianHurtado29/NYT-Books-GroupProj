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
        favoritesView.favoriteCollectionView.register(FavoritesCVC.self, forCellWithReuseIdentifier: "favoriteCell")
    }
    

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxWidth.width
        let itemHeight: CGFloat = maxWidth.height * 0.50
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath)
        
        cell.backgroundColor = .white
        return cell
    }
    
    
}
