//
//  RecomandVedioCell.swift
//  YouTube
//
//  Created by Turbo on 2020/5/27.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class RecomandVedioCell: UITableViewCell {
    
    var vedioImageView: UIImageView!
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
    
    private func createCellUI() {
        vedioImageView = UIImageView.init()
        vedioImageView!.backgroundColor = UIColor.white
        vedioImageView.layer.cornerRadius = 3
        vedioImageView.layer.masksToBounds = true
        self.contentView.addSubview(vedioImageView!)
        
        titleLabel = UILabel.init()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = kAppDarkGrayColor
        self.contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel.init()
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = UIColor.gray
        self.contentView.addSubview(descriptionLabel)
        
        timeLabel = UILabel.init()
        timeLabel.font = UIFont.systemFont(ofSize: 11)
        timeLabel.textColor = UIColor.white
        timeLabel.layer.borderColor = UIColor.white.cgColor
        timeLabel.layer.borderWidth = 1
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.backgroundColor = kAppDarkGrayColor
        timeLabel.alpha = 0.75
        self.contentView.addSubview(timeLabel)
        
        botLine = UIView.init()
        botLine.backgroundColor = kAppLineGrayColor
        self.contentView.addSubview(botLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    private func setupUIFrame() {
        vedioImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15.0)
            make.top.equalToSuperview().offset(10.0)
            make.width.equalTo(150)
            make.height.equalTo(90)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(vedioImageView.snp_right).offset(10.0)
            make.right.equalToSuperview().offset(-10.0)
            make.top.equalTo(vedioImageView)
            make.height.equalTo(20.0)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp_left)
            make.top.equalTo(titleLabel.snp_bottom).offset(5.0)
            make.width.equalTo(titleLabel)
            make.height.equalTo(15.0)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(vedioImageView.snp_right).offset(-5.0)
            make.bottom.equalTo(vedioImageView.snp_bottom).offset(-5.0)
            make.width.equalTo(36.0)
            make.height.equalTo(15.0)
        }
        
        botLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
}
