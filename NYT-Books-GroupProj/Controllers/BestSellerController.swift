//
//  ViewController.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import DataPersistence

class BestSellerController: UIViewController {
    
    var dataSource: [String] = []
    let bestseller = BestSellerView()
    var books = [BookInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.bestseller.collectionView.reloadData()
                self.bestseller.filterPicker.reloadAllComponents()
            }
        }
    }
    
    public var dataPersistence: DataPersistence<BookInfo>
    
    init(_ dataPersistence: DataPersistence<BookInfo>) {
        self.dataPersistence = dataPersistence
        //self.book = book
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = bestseller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBooks()
        loadGernal()
        view.backgroundColor = .white
        bestseller.filterPicker.dataSource = self
        bestseller.filterPicker.delegate = self
        bestseller.collectionView.delegate = self
        bestseller.collectionView.dataSource = self
        bestseller.collectionView.register(BooksCVC.self, forCellWithReuseIdentifier: "bestsellerCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bestseller.collectionView.reloadData()
        bestseller.filterPicker.reloadAllComponents()
    }
    
    func loadBooks(_ type: String = "Trade Fiction Paperback") {
        NYTBooksAPIClient.fetchBooks(for: "Trade Fiction Paperback") { (result) in
            switch result {
            case .success(let book):
                self.books = book
            case .failure(let error):
                fatalError("couldn't load api: \(error)")
            }
        }
    }
    
    func loadGernal() {
        NYTBooksAPIClient.fetchGenres { (result) in
            switch result {
            case .success(let gernal):
                print(gernal)
                for type in gernal {
                    self.dataSource.append(type.listName)
                }
            case .failure(let error):
                fatalError("couldn't load api: \(error)")
            }
        }
    }
}

extension BestSellerController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadBooks(dataSource[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
}

extension BestSellerController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestsellerCell", for: indexPath) as! BooksCVC
        let selectedBook = books[indexPath.row]
        cell.backgroundColor = .lightGray
        cell.configureCell(book: selectedBook)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width/2
        let itemHeight: CGFloat = maxSize.height * 0.30
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

