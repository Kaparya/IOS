//
//  TabBarController.swift
//  TabBar
//
//  Created by Damir Kandelov on 20.10.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        let mainController = ViewController()
        let tableController = TableViewController()
//        let collectionController = CollectionViewController()
        
        mainController.tabBarItem = UITabBarItem(title: "main", image: UIImage(systemName: "square.and.arrow.up.circle"), tag: 0)
        tableController.tabBarItem = UITabBarItem(title: "table", image: UIImage(systemName: "square.and.arrow.up.circle"), tag: 1)
//        collectionController.tabBarItem = UITabBarItem(title: "collection", image: UIImage(systemName: "square.and.arrow.up.circle"), tag: 3)
        
        viewControllers = [mainController, tableController, /*collectionController*/]
    }
}
