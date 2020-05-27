//
//  TabBarController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
    }
    
    func addChildViewControllers() {

        let v1 = HomeViewController()
        let v2 = TrendingViewController()
        let v3 = SubscriptionsViewController()
        let v4 = AccountViewController()
        
        v1.title = "Home"
        v2.title = "Trending"
        v3.title = "Vedios"
        v4.title = "Account"
        
        let nav1 = NavigationController(rootViewController: v1)
        let nav2 = NavigationController(rootViewController: v2)
        let nav3 = NavigationController(rootViewController: v3)
        let nav4 = NavigationController(rootViewController: v4)
        
        nav1.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home-1"))
        nav2.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "trending"), selectedImage: UIImage(named: "trending-1"))
        nav3.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "subscrps"), selectedImage: UIImage(named: "subscrps-1"))
        nav4.tabBarItem = UITabBarItem.init(title: "", image: UIImage(named: "account"), selectedImage: UIImage(named: "account-1"))
        
        self.tabBar.shadowImage = nil
        
        let barBackgroundView = UIView()
        barBackgroundView.frame = self.tabBar.bounds
        barBackgroundView.backgroundColor = kAppNavBarColor
        self.tabBar.insertSubview(barBackgroundView, at: 0)
        
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = kAppTabbarUnselColor
        
        self.viewControllers = [nav1, nav2, nav3, nav4]
    }
    
}
