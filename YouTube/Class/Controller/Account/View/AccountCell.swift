//
//  AccountCell.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
    
    var leftImageView: UIImageView!
    var titleLabel: UILabel!
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
        leftImageView = UIImageView.init(frame : CGRect(x:15.0, y:15.0, width:20.0, height:20.0))
        leftImageView!.backgroundColor = UIColor.white
        self.contentView.addSubview(leftImageView!)
        
        titleLabel = UILabel.init(frame: CGRect(x: 50, y: 15, width: 200, height: 20))
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.gray
        self.contentView.addSubview(titleLabel)
        
        botLine = UIView.init(frame: CGRect(x: 0, y: 49, width: MainScreenWidth, height: 1))
        botLine.backgroundColor = kAppLineGrayColor
        self.contentView.addSubview(botLine)
    }
}
