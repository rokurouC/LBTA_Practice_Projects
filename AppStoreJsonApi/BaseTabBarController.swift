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
            createNavController(viewController: TodayViewController(), title: "Today", tabBarItemImgName: "today_icon"),
            createNavController(viewController: AppsPageController(), title: "Apps", tabBarItemImgName: "apps"),
            createNavController(viewController: AppsSearchCollectionViewController(), title: "Search", tabBarItemImgName: "search")
            ]
        
    }
    
    func createNavController(viewController: UIViewController, title: String, tabBarItemImgName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = UIColor.white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: tabBarItemImgName)
        return navController
    }
}
