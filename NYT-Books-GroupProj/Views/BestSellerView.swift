//
//  BestSellerView.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class BestSellerView: UIView {
    
    var filterPicker: UIPickerView! = {
        let pv = UIPickerView(frame: CGRect.zero)
        pv.backgroundColor = .systemBackground
        return pv
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
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
        setupCollectionViewConstraints()
        setupPickerViewConstraints()
    }
    
    private func setupCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    private func setupPickerViewConstraints() {
        addSubview(filterPicker)
        filterPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterPicker.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            filterPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
