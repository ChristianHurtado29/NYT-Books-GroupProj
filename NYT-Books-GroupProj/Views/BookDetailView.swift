//
//  BookDetailView.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class BookDetailView: UIView {
    
    public lazy var bookImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "book.circle.fill")
        return iv
    }()
    
    public lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Christian Hurtado"
        label.textColor = .systemBlue
        return label
    }()
    
    public lazy var bookTextView: UITextView = {
        let btv = UITextView()
        btv.backgroundColor = .blue
        btv.text = "testing the book text view and it should be alooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong test"
        return btv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        setupBookImage()
        setupAuthorLabel()
        setupTextView()
    }
    
    private func setupBookImage() {
        addSubview(bookImageView)
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            bookImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -40),
            bookImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupAuthorLabel() {
        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalToSystemSpacingBelow: bookImageView.bottomAnchor, multiplier: 10),
            authorLabel.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor, constant: 8),
            authorLabel.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: -8)
        ])
    }
    
    private func setupTextView() {
        addSubview(bookTextView)
        bookTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            bookTextView.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor),
            bookTextView.trailingAnchor.constraint(equalTo: bookImageView.leadingAnchor),
            bookTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}


