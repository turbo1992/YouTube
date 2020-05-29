//
//  VedioCell.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class VedioCell: UITableViewCell {
    
    var vedioImageView: UIImageView!
    var logoImageView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var timeLabel: UILabel!
    var botLine: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        createCellUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    private func setupUIFrame() {
        vedioImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10.0)
            make.top.equalToSuperview().offset(10.0)
            make.right.equalToSuperview().offset(-10.0)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10.0)
            make.bottom.equalToSuperview().offset(-10.0)
            make.size.equalTo(40.0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(logoImageView.snp_right).offset(10.0)
            make.right.equalToSuperview().offset(-10.0)
            make.top.equalTo(logoImageView)
            make.height.equalTo(20.0)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp_left)
            make.top.equalTo(titleLabel.snp_bottom).offset(5.0)
            make.width.equalTo(titleLabel)
            make.height.equalTo(15.0)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15.0)
            make.bottom.equalToSuperview().offset(-65.0)
            make.width.equalTo(50.0)
            make.height.equalTo(17.0)
        }
        
        botLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(0.5)
            make.width.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
    
    private func createCellUI() {
        vedioImageView = UIImageView.init()
        vedioImageView!.backgroundColor = UIColor.white
        self.contentView.addSubview(vedioImageView!)
        
        logoImageView = UIImageView.init()
        logoImageView!.backgroundColor = UIColor.white
        logoImageView.layer.cornerRadius = 20
        logoImageView.layer.masksToBounds = true
        self.contentView.addSubview(logoImageView!)
        
        titleLabel = UILabel.init()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = kAppDarkGrayColor
        self.contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel.init()
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.textColor = UIColor.gray
        self.contentView.addSubview(descriptionLabel)
        
        timeLabel = UILabel.init()
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = UIColor.white
        timeLabel.layer.borderColor = UIColor.white.cgColor
        timeLabel.layer.borderWidth = 1
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.backgroundColor = kAppDarkGrayColor
        timeLabel.alpha = 0.65
        self.contentView.addSubview(timeLabel)
        
        botLine = UIView.init()
        botLine.backgroundColor = kAppLineGrayColor
        self.contentView.addSubview(botLine)
    }
}
