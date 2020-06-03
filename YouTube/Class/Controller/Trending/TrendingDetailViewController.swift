//
//  TrendingDetailViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/6/3.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

protocol TrendingBackDelegate:NSObjectProtocol {
    func trendingBack(res: String)
}

class TrendingDetailViewController: BaseViewController {
    
    weak var delegate: TrendingBackDelegate?
    var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TrendingDetail"
        self.setLeftImageNamed(name: "back", action: #selector(self.popBackController))

        btn = UIButton()
        btn.backgroundColor = kAppMainRedColor
        btn.setTitle("test delegate", for: UIControl.State.normal)
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action: #selector(callBackAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(70)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        
    }
    
    @objc func callBackAction() {
        self.delegate!.trendingBack(res: "trending")
    }
    
    func reLoadUI(color: UIColor, callBack:(String)->()) {
        btn.backgroundColor = color
        callBack("purple color")
    }

}
