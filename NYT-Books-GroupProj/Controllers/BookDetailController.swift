//
//  BookDetailController.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import DataPersistence

class BookDetailController: UIViewController {
    
    public var book: BookInfo
    
    public var dataPersistence: DataPersistence<BookInfo>
    
    private let bookDetailView = BookDetailView()
    
    init(_ dataPersistence: DataPersistence<BookInfo>, book: BookInfo) {
      self.dataPersistence = dataPersistence
      self.book = book
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(didTap(_:)))
        return gesture
    }()
    
    override func loadView() {
        view = bookDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = book.title
        view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(didFavoriteItem(_:)))
    }
    
    private func updateUI() {
        bookDetailView.bookImageView.isUserInteractionEnabled = true
        bookDetailView.bookImageView.addGestureRecognizer(tapGesture)
        
        bookDetailView.authorLabel.text = "\(book.author)"
        bookDetailView.bookTextView.text = "\(book.description)"
        bookDetailView.bookImageView.getImage(with: book.bookImage) { [weak self] (result) in
            
            switch result {
            case .failure(let appError):
                print("no image found: \(appError)")
            case .success(let image):
                self?.bookDetailView.bookImageView.image = image
            }
        }
    }
    
    @objc func didFavoriteItem(_ sender: UIBarButtonItem) {
        sender.image = UIImage(systemName: "star.fill")
        
        do  {
            try dataPersistence.createItem(book)
        } catch {
            print("could not favorite item")
        }
    }

    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        
        guard let amazonURL = self.book.buyLinks.first else {return }
        guard let url = URL(string: amazonURL.url) else { return }
        UIApplication.shared.open(url)
    }
    
    
}
