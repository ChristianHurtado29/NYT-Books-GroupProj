//
//  TabBarController.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import DataPersistence

class TabBarController: UITabBarController {
    
    private var dataPersistence = DataPersistence<Books>(filename: "books.plist")
    
   // private var userPreference = UserPreference()
    
    private lazy var bestSellerController: BestSellerController = {
        let viewController = BestSellerController(dataPersistence)
        viewController.dataPersistence = dataPersistence
        viewController.tabBarItem = UITabBarItem(title: "Bestseller", image: UIImage(systemName: "rosette"), tag: 0)
        return viewController
    }()
    
    private lazy var favoritesViewController: FavoritesViewController = {
        let viewController = FavoritesViewController(dataPersistence)
        viewController.dataPersistence = dataPersistence
        viewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "bookmark"), tag: 1)
        return viewController
    }()
    
    private lazy var bookDetailController: BookDetailController = {
        let viewController = BookDetailController(dataPersistence)
        viewController.dataPersistence = dataPersistence
        return viewController
    }()
    
    private lazy var settingsViewController: SettingsViewController = {
        let viewController = SettingsViewController()
        viewController.dataPersistence = dataPersistence
        viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        return viewController
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [UINavigationController(rootViewController:bestSellerController), UINavigationController(rootViewController:favoritesViewController), UINavigationController(rootViewController:settingsViewController)]
        
    }
    
}
