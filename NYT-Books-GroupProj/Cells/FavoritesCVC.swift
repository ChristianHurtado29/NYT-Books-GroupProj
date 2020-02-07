//
//  FavoritesCVC.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class FavoritesCVC: UICollectionViewCell {
    
    public lazy var favoriteImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.image = UIImage(systemName: "book.circle")
        return iv
    }()
    
    public lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil.and.ellipsis.rectangle"), for: .normal)
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
    
}
