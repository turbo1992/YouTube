//
//  CommentListCell.swift
//  YouTube
//
//  Created by Turbo on 2020/6/4.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class CommentListCell: UITableViewCell {
    
    var userLogoImgView: UIImageView!
    var commentTitle: UILabel!
    var commentImgView: UIImageView!
    var commentDes: UILabel!
    var timeLabel: UILabel!
    var botLine: UIView!
    var images: Array<String>!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        createCellUI()
        setupUIFrame()
    }
    
    func setImageViews(images: Array<String>) {
        self.images = images
        updateCommentImgVConstant()
    }
    
    func updateCommentImgVConstant() {
        if (self.images != nil && self.images.count > 0) {
            commentImgView.image = UIImage(named: self.images[0])
            self.commentImgView.snp.updateConstraints { (make) in
                make.height.equalTo((MainScreenWidth - 90) / 3)
            }
        } else {
            commentImgView.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCommentImgVConstant()
    }
    
    private func setupUIFrame() {
        userLogoImgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10.0)
            make.left.equalToSuperview().offset(10.0)
            make.size.equalTo(40.0)
        }
        
        commentTitle.snp.makeConstraints { (make) in
            make.left.equalTo(userLogoImgView.snp_right).offset(10.0)
            make.right.equalToSuperview().offset(-10.0)
            make.top.equalTo(userLogoImgView)
            make.height.equalTo(20.0)
        }

        commentImgView.snp.makeConstraints { (make) in
            make.left.equalTo(commentTitle.snp_left)
            make.top.equalTo(commentTitle.snp_bottom).offset(10.0)
            make.size.equalTo((MainScreenWidth - 90) / 3)
        }

        commentDes.snp.makeConstraints { (make) in
            make.left.equalTo(commentTitle.snp_left)
            make.top.equalTo(commentImgView.snp_bottom).offset(10.0)
            make.width.equalTo(commentTitle)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(commentDes.snp_bottom).offset(12.0)
            make.width.equalTo(120)
            make.height.equalTo(15)
        }
        
        botLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1.0)
            make.top.equalTo(timeLabel.snp.bottom).offset(12)
            make.bottom.equalTo(0)
        }
    }
    
    private func createCellUI() {
        userLogoImgView = UIImageView.init()
        userLogoImgView!.backgroundColor = UIColor.white
        userLogoImgView.layer.cornerRadius = 20
        userLogoImgView.layer.masksToBounds = true
        self.contentView.addSubview(userLogoImgView!)
        
        commentTitle = UILabel.init()
        commentTitle.font = UIFont.systemFont(ofSize: 15)
        commentTitle.textColor = kAppDarkGrayColor
        self.contentView.addSubview(commentTitle)
        
        commentImgView = UIImageView.init()
        commentImgView!.backgroundColor = UIColor.white
        self.contentView.addSubview(commentImgView!)
        
        commentDes = UILabel.init()
        commentDes.font = UIFont.systemFont(ofSize: 13)
        commentDes.textColor = UIColor.gray
        commentDes.numberOfLines = 0
        self.contentView.addSubview(commentDes)
        
        timeLabel = UILabel.init()
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = kAppDarkGrayColor
        timeLabel.textAlignment = .right
        self.contentView.addSubview(timeLabel)
        
        botLine = UIView.init()
        botLine.backgroundColor = kAppLineGrayColor
        self.contentView.addSubview(botLine)
    }
}
