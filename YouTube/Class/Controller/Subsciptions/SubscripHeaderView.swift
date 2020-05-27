//
//  SubscripHeaderView.swift
//  YouTube
//
//  Created by Turbo on 2020/5/27.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class SubscripHeaderView: UIView {
        
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
        backgroundColor = UIColor.white
        
        addSubview(logoImageView1)
        addSubview(logoImageView2)
        addSubview(logoImageView3)
        addSubview(logoImageView4)
        addSubview(logoImageView5)
        addSubview(logoImageView6)
    }
    
    private func setupUIFrame() {
        
    }
    
    // MARK: - 懒加载
    lazy var logoImageView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "channel1"))
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 15, y: 25, width: 50, height: 50)
        return imageView
    }()
    
    lazy var logoImageView2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "channel2"))
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 80, y: 25, width: 50, height: 50)
        return imageView
    }()
    
    lazy var logoImageView3: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "channel3"))
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 145, y: 25, width: 50, height: 50)
        return imageView
    }()
    
    lazy var logoImageView4: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "channel4"))
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 210, y: 25, width: 50, height: 50)
        return imageView
    }()
    
    lazy var logoImageView5: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "channel5"))
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 275, y: 25, width: 50, height: 50)
        return imageView
    }()
    
    lazy var logoImageView6: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "channel7"))
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 340, y: 25, width: 50, height: 50)
        return imageView
    }()
}
