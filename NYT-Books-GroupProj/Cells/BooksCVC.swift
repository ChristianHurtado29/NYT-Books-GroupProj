//
//  BooksCVC.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class BooksCVC: UICollectionViewCell {
    public lazy var newsImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    public lazy var bookTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Artical Title"
        return label
    }()
    
    public lazy var bookDiscription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.text = "Abstract headline"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupBookImageViewConstrains()
        setupBookTitleConstraints()
        setupBookDiscriptionConstraints()
    }
    
    private func setupBookImageViewConstrains() {
        addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            newsImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor),
        ])
    }
    
    private func setupBookTitleConstraints() {
        addSubview(bookTitle)
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),
            bookTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bookTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupBookDiscriptionConstraints() {
        addSubview(bookDiscription)
        bookDiscription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookDiscription.leadingAnchor.constraint(equalTo: bookTitle.leadingAnchor),
            bookDiscription.trailingAnchor.constraint(equalTo: bookTitle.trailingAnchor),
            bookDiscription.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 8)
        ])
    }
    
    public func configureCell(book: BookInfo) {
        bookTitle.text = book.title
        
        bookDiscription.text = book.description
        
        newsImageView.getImage(with: book.bookImage) { [weak self](result) in
            
            switch result {
            case .failure(let appError):
                print("no image found: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.newsImageView.image = image
                }
            }
        }
    }
}
