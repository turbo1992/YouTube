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
    var cmtImgView: UIImageView!
    var commentDes: UILabel!
    var timeLabel: UILabel!
    var botLine: UIView!
    var images: Array<Any>!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        createCellUI()
        setupUIFrame()
    }
    
    func setImageViews(images: Array<Any>) {
        self.images = images
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUIFrame()
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
        
//        for imageV in imgArray {
//            imageV.isHidden = true
//        }
                
//        if (self.images != nil) {
//            let width = (MainScreenWidth - 90) / 3
//            for (idx, item) in self.images.enumerated() {
//                print(idx)
//                print(item)
//                let imageView = self.imgArray[idx]
//                imageView.image = UIImage(named: "channel4")
////                imageView.isHidden = false
//                self.contentView.addSubview(imageView)
//
//                imageView.snp.makeConstraints { (make) in
//                    make.left.equalTo(commentTitle)
//                    make.top.equalTo(commentTitle.snp_bottom).offset(10)
//                    make.size.equalTo(width)
//                }
//            }
//        }
                
//        cmtImgView.isHidden = true
//        if (self.images != nil && self.images.count > 0) {
//            cmtImgView.image = UIImage(named: "channel4")
//            cmtImgView.snp.makeConstraints { (make) in
//                make.left.equalTo(commentTitle.snp_left)
//                make.top.equalTo(commentTitle.snp_bottom).offset(10.0)
//                make.size.equalTo((MainScreenWidth - 90) / 3)
//            }
//            cmtImgView.isHidden = false
//            commentDes.snp.makeConstraints { (make) in
//                make.left.equalTo(commentTitle.snp_left)
//                make.top.equalTo(cmtImgView.snp_bottom).offset(5.0)
//                make.width.equalTo(commentTitle)
//            }
//        } else {
            commentDes.snp.makeConstraints { (make) in
                make.left.equalTo(commentTitle.snp_left)
                make.top.equalTo(commentTitle.snp_bottom).offset(5.0)
                make.width.equalTo(commentTitle)
            }
//        }
        
        
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
        
        cmtImgView = UIImageView.init()
        cmtImgView!.backgroundColor = UIColor.white
        self.contentView.addSubview(cmtImgView!)
        
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
    
    lazy var imgArray: Array<UIImageView> = {
        var arr:Array<UIImageView> = Array()
        for index in 0...2 {
            let imageV = UIImageView()
            self.contentView.addSubview(imageV)
            imageV.isHidden = true
            arr.append(imageV)
        }
        return arr
    }()
}
