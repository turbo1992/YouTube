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
        addSubview(logoButton)
        addSubview(userNameLabel)
        
    }
    
    private func setupUIFrame() {
        bgimageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalToSuperview()
        }
        logoButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(30)
            make.size.equalTo(50)
        }
        userNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(90)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(15)
        }
    }
    
    public func fillViewWithData(url: String) {
        logoButton.imageView!.kf.setImage(with: URL(string: url))
    }
    
    func changeButtonImage(name: String, callBack:(String)->()) {
        logoButton.setImage(UIImage(named: name), for: UIControl.State.normal)
        callBack(name)
    }
    
    // MARK: - 懒加载
    lazy var bgimageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "banner"))
        return imageView
    }()
    
    lazy var logoButton: UIButton = {
        let logoButton = UIButton()
        logoButton.layer.cornerRadius = 25
        logoButton.layer.masksToBounds = true
        logoButton.setImage(UIImage(named: "channel5"), for: UIControl.State.normal)
        return logoButton
    }()
    
    lazy var userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.textColor = UIColor.white
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        userNameLabel.text = "Haki Lortiry"
        return userNameLabel
    }()
}
