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
        iv.image = UIImage(systemName: "doc.plaintext")
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
        return text
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
        
    }
    
    
}
