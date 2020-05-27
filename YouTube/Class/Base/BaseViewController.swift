//
//  BaseViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
//        self.hidesBottomBarWhenPushed = true
    }
    
    func setLeftImageNamed(name: String, action: Selector) {
        let image = UIImage(named: name)
        let backItem = UIBarButtonItem.init(image: image, style: UIBarButtonItem.Style.plain, target: self, action: action)
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    func setNavigationBarBackgroundImage(image: UIImage, tintColor: UIColor, textColor: UIColor, style: UIStatusBarStyle) {
        
    }
    
    @objc func popBackController() {
        self.navigationController?.popViewController(animated: true)
    }

}
