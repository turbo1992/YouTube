//
//  VedioDetailHeaderView.swift
//  YouTube
//
//  Created by Turbo on 2020/5/27.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class VedioDetailHeaderView: UIView {
    
    var vedioImageView: UIImageView!
    var titleLabel: UILabel!
    var playersLabel: UILabel!
    
    
    var topLine: UIView!
    var botLine: UIView!

    var logoImageView: UIImageView!
    var userNameLabel: UILabel!
    var desLabel: UILabel!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // MARK: - 视图
    private func setupUI(){
        backgroundColor = UIColor.white
        
        vedioImageView = UIImageView()
        addSubview(vedioImageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.textColor = kAppTextColor
        addSubview(titleLabel)
        
        playersLabel = UILabel()
        playersLabel.font = UIFont.systemFont(ofSize: 12)
        playersLabel.textColor = kAppDarkGrayColor
        addSubview(playersLabel)
        
        let thumbs = ["thumbUp", "thumbDown", "My Videos", "Notifications"]
        let counts = ["352K", "8.9K", "0", "Warnings"]
        let padding = 50.0
        let width = 20.0
        
        for (idx, item) in thumbs.enumerated() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: item)
            addSubview(imageView)
            
            let countLabel = UILabel()
            countLabel.text = counts[idx]
            countLabel.font = UIFont.systemFont(ofSize: 11)
            countLabel.textColor = kAppDarkGrayColor
            countLabel.textAlignment = NSTextAlignment.center
            addSubview(countLabel)
            
            // layout
            let orginX = 20.0 + Double(idx) * (padding+width)
            imageView.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(orginX)
                make.size.equalTo(width)
                make.top.equalTo(playersLabel.snp_bottom).offset(15.0)
            }
            countLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(imageView)
                make.top.equalTo(imageView.snp_bottom).offset(5)
                make.width.equalTo(50)
                make.height.equalTo(15)
            }
        }
        
        topLine = UIView.init()
        topLine.backgroundColor = kAppLineGrayColor
        addSubview(topLine)
        
        botLine = UIView.init()
        botLine.backgroundColor = kAppLineGrayColor
        addSubview(botLine)
        
        logoImageView = UIImageView.init()
        logoImageView!.backgroundColor = UIColor.white
        logoImageView.layer.cornerRadius = 20
        logoImageView.layer.masksToBounds = true
        addSubview(logoImageView!)
        
        userNameLabel = UILabel.init()
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 14.5)
        userNameLabel.textColor = kAppDarkGrayColor
        addSubview(userNameLabel)
        
        desLabel = UILabel.init()
        desLabel.font = UIFont.systemFont(ofSize: 12)
        desLabel.textColor = UIColor.gray
        addSubview(desLabel)
    }
    
    public func fillViewData(data: VedioData) {
        vedioImageView.image = UIImage(named: data.vedioImgUrl)
        titleLabel.text = data.title
        playersLabel.text = "472,341 views"
        logoImageView.image = UIImage(named: data.authLogo)
        userNameLabel.text = "Author"
        desLabel.text = data.createTime
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    private func setupUIFrame() {
        vedioImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(210)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(vedioImageView.snp_bottom).offset(10)
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(MainScreenWidth-20)
            make.height.equalTo(18)
        }
        
        playersLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(MainScreenWidth-20)
            make.height.equalTo(15)
        }
        
        topLine.snp.makeConstraints { (make) in
            make.top.equalTo(playersLabel).offset(80)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        botLine.snp.makeConstraints { (make) in
            make.top.equalTo(playersLabel).offset(140)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(playersLabel).offset(90)
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(logoImageView.snp_right).offset(10)
            make.top.equalTo(logoImageView.snp_top)
            make.width.equalTo(MainScreenWidth-100)
            make.height.equalTo(20)
        }
        
        desLabel.snp.makeConstraints { (make) in
            make.left.equalTo(logoImageView.snp_right).offset(10)
            make.top.equalTo(userNameLabel.snp_bottom).offset(3)
            make.width.equalTo(MainScreenWidth-100)
            make.height.equalTo(15)
        }
    }
}

