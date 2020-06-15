//
//  TabBarController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class TabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildControllers()
    }
    
    func addChildControllers() {
        let v1 = HomeViewController()
        let v2 = TrendingViewController()
        let v3 = SubscriptionsViewController()
        let v4 = AccountViewController()
        
        v1.title = ""
        v2.title = ""
        v3.title = ""
        v4.title = ""
        
        let nav1 = BaseNavigationController(rootViewController: v1)
        let nav2 = BaseNavigationController(rootViewController: v2)
        let nav3 = BaseNavigationController(rootViewController: v3)
        let nav4 = BaseNavigationController(rootViewController: v4)
        
        nav1.tabBarItem = ESTabBarItem.init(BouncesContentView(), title: "首页", image: UIImage(named: "tabbar-1"), selectedImage: UIImage(named: "tabbar-1"))
        nav2.tabBarItem = ESTabBarItem.init(BouncesContentView(), title: "时下流行", image: UIImage(named: "tabbar-2"), selectedImage: UIImage(named: "tabbar-2"))
        nav3.tabBarItem = ESTabBarItem.init(BouncesContentView(), title: "媒体库", image: UIImage(named: "tabbar-3"), selectedImage: UIImage(named: "tabbar-3"))
        nav4.tabBarItem = ESTabBarItem.init(BouncesContentView(), title: "我的", image: UIImage(named: "tabbar-4"), selectedImage: UIImage(named: "tabbar-4"))
        
        self.tabBar.shadowImage = nil

        let barBackgroundView = UIView()
        barBackgroundView.frame = CGRect(x: 0, y: 0, width: MainScreenWidth, height: 120)
        barBackgroundView.backgroundColor = kAppTabBarColor
        self.tabBar.insertSubview(barBackgroundView, at: 0)
                
        self.viewControllers = [nav1, nav2, nav3, nav4]
    }
}
