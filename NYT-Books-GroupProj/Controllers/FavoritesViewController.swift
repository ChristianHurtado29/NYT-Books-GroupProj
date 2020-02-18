//
//  MainViewController.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import DataPersistence

class FavoritesViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<BookInfo>
    
    let favoritesView = FavoritesView()
    //put data persistence here
    
    init(_ dataPersistence: DataPersistence<BookInfo>) {
        self.dataPersistence = dataPersistence
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var books = [BookInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesView.favoriteCollectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        favoritesView.favoriteCollectionView.delegate = self
        favoritesView.favoriteCollectionView.dataSource = self
        dataPersistence.delegate = self
        favoritesView.favoriteCollectionView.register(FavoritesCVC.self, forCellWithReuseIdentifier: "favoriteCell")
        dataPersistence.delegate = self
        loadData()
    }
    
    private func loadData() {
        do {
            books = try dataPersistence.loadItems()
        }catch {
            print("could not load favorites")
        }
        
    }
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxWidth.width * 0.90
        let itemHeight: CGFloat = maxWidth.height * 0.50
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as? FavoritesCVC else {
            fatalError("could not downcast as FavoritesCVC")
        }
        let selectedBook = books[indexPath.row]
        cell.backgroundColor = .white
        cell.configureCell(book: selectedBook)
        
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //segue to detail controller
        let selectedBook = books[indexPath.row]
        let bookDetailVC = BookDetailController(dataPersistence, book: selectedBook)
        navigationController?.pushViewController(bookDetailVC, animated: true)
    }
    
    
}

extension FavoritesViewController: FavoriteDelegate {
    func didFavorite(_ favoriteCell: FavoritesCVC, _ favBook: BookInfo) {
        //delete item
        //see on amazon
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (alertAction) in
            self.didDelete(book: favBook)
        }
        let amazonAction = UIAlertAction(title: "Find on Amazon", style: .default) { (alertAction) in
            guard let amazonURL = favBook.buyLinks.first else {return }
            guard let url = URL(string: amazonURL.url) else { return }
            UIApplication.shared.open(url)
        }
        let appleAction = UIAlertAction(title: "Find on Apple Books", style: .default) { (alertAction) in
            guard let url = URL(string: favBook.buyLinks[1].url) else { return }
            UIApplication.shared.open(url)
        }
        let barnesAction = UIAlertAction(title: "Find on Barnes and Noble", style: .default) { (alertAction) in
            guard let url = URL(string: favBook.buyLinks[2].url ) else { return }
            UIApplication.shared.open(url)
        }
        let localAction = UIAlertAction(title: "Find Locally", style: .default) { (alertAction) in
            guard let url = URL(string: favBook.buyLinks[3].url ) else { return }
            UIApplication.shared.open(url)
        }

        alertController.addAction(deleteAction)
        alertController.addAction(amazonAction)
        alertController.addAction(appleAction)
        alertController.addAction(barnesAction)
        alertController.addAction(localAction)
        
        present(alertController, animated: true)
        
    }
    
    private func didDelete(book: BookInfo) {
        guard let index = books.firstIndex(of: book) else {return}
        
        do {
            //data persistence delete here
            try dataPersistence.deleteItem(at: index)
        } catch {
            print("error deleting item: \(error)")
        }
    }

    
}

extension FavoritesViewController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        loadData()
    }

    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        loadData()
    }

}
