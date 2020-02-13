//
//  FavoritesCVC.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import ImageKit

protocol FavoriteDelegate {
    func didFavorite(_ favoriteCell: FavoritesCVC, _ favBook: BookInfo)
}

class FavoritesCVC: UICollectionViewCell {
    
    public lazy var favoriteImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGroupedBackground
        iv.image = UIImage(systemName: "book.circle")
        return iv
    }()
    
    public lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil.and.ellipsis.rectangle"), for: .normal)
        button.addTarget(self, action: #selector(editButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.backgroundColor = .green
        return label
    }()
    
    private lazy var textView: UITextView = {
        let text = UITextView()
        text.backgroundColor = .orange
        return text
    }()
    
    public var delegate: FavoriteDelegate!
    private var bookItem: BookInfo!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        setUpFavoriteImageConstraints()
        setUpEditButtonConstraints()
        setUpTitleLabelConstraints()
        setUpTextViewConstraints()
    }
    
    @objc private func editButtonPressed(_ sender: UIButton) {
        delegate.didFavorite(self, bookItem)
    }
    
    private func setUpFavoriteImageConstraints() {
        addSubview(favoriteImage)
        
        favoriteImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoriteImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            favoriteImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            favoriteImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            favoriteImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
    
        ])
    }
    
    private func setUpEditButtonConstraints() {
        addSubview(editButton)

        editButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            editButton.leadingAnchor.constraint(equalTo: favoriteImage.trailingAnchor, constant: 8),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            editButton.heightAnchor.constraint(equalToConstant: 60),
            editButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setUpTitleLabelConstraints() {
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: favoriteImage.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setUpTextViewConstraints() {
        addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    public func configureCell(book: BookInfo) {
        titleLabel.text = book.title
        
        textView.text = book.description
        
        favoriteImage.getImage(with: book.bookImage) { [weak self](result) in
            
            switch result {
            case .failure(let appError):
                print("no image found: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.favoriteImage.image = image
                }
            }
        }
    }
    
}
