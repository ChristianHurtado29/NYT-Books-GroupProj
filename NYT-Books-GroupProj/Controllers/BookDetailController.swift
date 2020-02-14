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
    
    public var dataPersistence: DataPersistence<BookInfo>
    
    init(_ dataPersistence: DataPersistence<BookInfo>) {
      self.dataPersistence = dataPersistence
      //self.book = book
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
