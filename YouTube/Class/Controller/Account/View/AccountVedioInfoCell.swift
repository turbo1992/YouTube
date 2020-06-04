//
//  AccountVedioInfoCell.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class AccountVedioInfoCell: UITableViewCell {
    
    var leftImageView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
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
        leftImageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(15)
            make.size.equalTo(50)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp_right).offset(15)
            make.top.equalTo(leftImageView).offset(2.5)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp_bottom).offset(5)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(20)
        }
        botLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func createCellUI() {
        leftImageView = UIImageView()
        leftImageView!.backgroundColor = UIColor.white
        leftImageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.contentView.addSubview(leftImageView!)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = kAppDarkGrayColor
        self.contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.text = "42 vedios"
        self.contentView.addSubview(descriptionLabel)
        
        botLine = UIView()
        botLine.backgroundColor = kAppLineGrayColor
        self.contentView.addSubview(botLine)
    }
}
