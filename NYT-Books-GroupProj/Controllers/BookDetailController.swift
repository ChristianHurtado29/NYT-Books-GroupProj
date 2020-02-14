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
    
    override func loadView() {
        view = bookDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = book.title
        view.backgroundColor = .yellow
    }
    

}
