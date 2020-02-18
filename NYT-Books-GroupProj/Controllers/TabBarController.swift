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
    var backbroundCollections: Set<UIImageView>  = []
    var randomSizeList: [CGFloat] = [40, 45, 50, 55, 60, 65]
    var randomAlpha: [CGFloat] = [0.8, 0.9, 1.0, 1.0]
    var colors: [UIColor] = [.blue, .systemBlue, .white]
    var animationTimer: Timer?
    var minHeight: CGFloat = 0
    var currentX: CGFloat = 0
    var counter = 0
    var alphaCount:CGFloat = 0.0
    var reset = UIButton()
    var randomColor = UIColor()
    
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
        animationTimer = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(loadingScreen), userInfo: nil, repeats: true)
    }
    
    @objc func loadingScreen() {
        let currentY: CGFloat = minHeight
        let randomSize = randomSizeList.randomElement()!
        
        let cell = UIImageView(frame: CGRect(x: currentX, y: currentY, width: randomSize, height: randomSize))
        cell.layer.cornerRadius = 10
        cell.backgroundColor = colors.randomElement()!
        cell.alpha = randomAlpha.randomElement()!
        self.view.addSubview(cell)
        backbroundCollections.insert(cell)
        self.currentX += randomSize
        
        if currentX >= view.frame.maxX {
            self.minHeight += 10
            currentX = 0
        }
        
        if currentY >= view.frame.maxY {
            for cell in backbroundCollections {
                cell.alpha = 1
            }
            animationTimer?.invalidate()
            viewControllers = [UINavigationController(rootViewController:bestSellerController), UINavigationController(rootViewController:favoritesViewController), UINavigationController(rootViewController:settingsViewController)]
            
            animationTimer = Timer.scheduledTimer(timeInterval: 0.004, target: self, selector: #selector(removeCell), userInfo: nil, repeats: true)
        }
    }
    
    @objc func removeCell() {
        if !backbroundCollections.isEmpty {
            let removedCell = backbroundCollections.removeFirst()
            removedCell.removeFromSuperview()
        } else {
            animationTimer?.invalidate()
            
        }
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
