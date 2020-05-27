//
//  AccountHeaderView.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class AccountHeaderView: UIView {
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    // MARK: - 视图
    private func setupUI(){
        backgroundColor = UIColor.yellow
        
        addSubview(bgimageView)
        addSubview(logoImageView)
        addSubview(userNameLabel)
    }
    
    private func setupUIFrame() {
        
    }
    
    // MARK: - 懒加载
    lazy var bgimageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "banner"))
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        return imageView
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "channel4"))
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 25, y: 30, width: 50, height: 50)
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.frame = CGRect(x: 25, y: 90, width: 200, height: 15)
        userNameLabel.textColor = UIColor.white
        userNameLabel.font = UIFont.systemFont(ofSize: 14)
        userNameLabel.text = "Haki Lortiry"
        return userNameLabel
    }()
}
