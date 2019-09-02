//
//  BaseTabBarController.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/7/1.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class BaseTabBarCOntroller: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: AppsControllerL(), title: "Apps", tabBarItemImgName: "apps"),
            createNavController(viewController: AppsSearchCollectionViewController(), title: "Search", tabBarItemImgName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", tabBarItemImgName: "today_icon")]
        
    }
    
    func createNavController(viewController: UIViewController, title: String, tabBarItemImgName: String) -> UIViewController {
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = UIColor.white
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: tabBarItemImgName)
        return navController
    }
}
