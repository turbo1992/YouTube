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
    
    func createCellUI() {
        leftImageView = UIImageView.init(frame : CGRect(x:15.0, y:15.0, width:50.0, height:50.0))
        leftImageView!.backgroundColor = UIColor.white
        leftImageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.contentView.addSubview(leftImageView!)
        
        titleLabel = UILabel.init(frame: CGRect(x: 80, y: 15, width: 300, height: 20))
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = kAppDarkGrayColor
        self.contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel.init(frame: CGRect(x: 80, y: 45, width: 200, height: 20))
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.text = "42 vedios"
        self.contentView.addSubview(descriptionLabel)
        
        botLine = UIView.init(frame: CGRect(x: 0, y: 79, width: MainScreenWidth, height: 1))
        botLine.backgroundColor = kAppLineGrayColor
        self.contentView.addSubview(botLine)
    }
}
