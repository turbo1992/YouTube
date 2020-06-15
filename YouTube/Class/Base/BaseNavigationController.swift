//
//  BaseNavigationController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: kAppDarkTextColor]
        self.navigationBar.isTranslucent = false
    }
    
}
