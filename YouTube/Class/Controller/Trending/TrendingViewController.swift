//
//  TrendingViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class TrendingViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
        HttpClient().getArticleList()
    }
    
    func createUI() {
        let box = UIView()
        box.backgroundColor = UIColor.purple
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.size.equalTo(100)
            make.center.equalToSuperview()
        }
    }

}
