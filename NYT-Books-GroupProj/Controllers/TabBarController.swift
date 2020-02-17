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
    
    private var dataPersistence = DataPersistence<BookInfo>(filename: "books.plist")
    
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
    
    private lazy var settingsViewController: SettingsViewController = {
        let viewController = SettingsViewController()
        viewController.dataPersistence = dataPersistence
        viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        return viewController
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        viewControllers = [UINavigationController(rootViewController:bestSellerController), UINavigationController(rootViewController:favoritesViewController), UINavigationController(rootViewController:settingsViewController)]
        
    }
    
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let currentView = selectedViewController?.view, let destinationView = viewController.view else {
            return false
        }
        
        if currentView != destinationView {
            UIView.transition(from: currentView, to: destinationView, duration: 1.0, options: [.transitionCurlUp], completion: nil)
        }
        
        return true
    }
}
