//
//  TrendingLineCell.swift
//  YouTube
//
//  Created by Turbo on 2020/6/5.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class TrendingLineCell: UITableViewCell {
    
    var userLogoImgView: UIImageView!
    var userNameLabel: UILabel!
    var createLabel: UILabel!
    var collectionView: UICollectionView!
    var lineDesLabel: UILabel!
    var botLine: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.contentView.layer.masksToBounds = true
        
        createCellUI()
        setupUIFrame()
    }
    
    func createCellUI() {
        userLogoImgView = UIImageView.init()
        userLogoImgView!.backgroundColor = UIColor.white
        userLogoImgView.layer.cornerRadius = 20
        userLogoImgView.layer.masksToBounds = true
        self.contentView.addSubview(userLogoImgView!)
        
        userNameLabel = UILabel.init()
        userNameLabel.font = UIFont.systemFont(ofSize: 15)
        userNameLabel.textColor = kAppDarkGrayColor
        self.contentView.addSubview(userNameLabel)
        
        createLabel = UILabel.init()
        createLabel.font = UIFont.systemFont(ofSize: 12)
        createLabel.textColor = UIColor.gray
        self.contentView.addSubview(createLabel)
        
        let layout = UICollectionViewFlowLayout.init()
        collectionView = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TrendingLinePicCell.self, forCellWithReuseIdentifier:"TrendingLinePicCell")
        self.contentView.addSubview(collectionView)
        
        lineDesLabel = UILabel.init()
        lineDesLabel.font = UIFont.systemFont(ofSize: 13)
        lineDesLabel.textColor = UIColor.gray
        lineDesLabel.numberOfLines = 0
        self.contentView.addSubview(lineDesLabel)
        
        botLine = UIView.init()
        botLine.backgroundColor = kAppLineGrayColor
        self.contentView.addSubview(botLine)
    }
    
    var lineData:TrendingLineData? {
        didSet {
            guard lineData != nil else {return}
            self.userLogoImgView.image = UIImage(named: (lineData?.logo_url)!)
            self.userNameLabel.text = lineData?.user_name
            self.createLabel.text = lineData?.time
            
            let picNum = lineData?.line_pics?.count ?? 0
            var num:CGFloat = 0
            if picNum > 0 && picNum <= 3 {
                num = 1
            } else if picNum > 3 && picNum <= 6 {
                num = 2
            } else if picNum > 6 {
                num = 3
            }
            let OnePicHeight = CGFloat((MainScreenWidth-30)/3)
            let picHeight = num * OnePicHeight
            self.collectionView.snp.updateConstraints { (make) in
                make.height.equalTo(picHeight + 20)
            }
            self.collectionView.reloadData()
            
            lineDesLabel.text = lineData?.line_des
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    private func setupUIFrame() {
        userLogoImgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10.0)
            make.left.equalToSuperview().offset(10.0)
            make.size.equalTo(40.0)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userLogoImgView.snp_right).offset(10.0)
            make.right.equalToSuperview().offset(-10.0)
            make.top.equalTo(userLogoImgView)
            make.height.equalTo(20.0)
        }
        
        createLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userNameLabel)
            make.right.equalToSuperview().offset(-10.0)
            make.top.equalTo(userNameLabel.snp.bottom).offset(2.0)
            make.height.equalTo(15.0)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(userLogoImgView.snp.bottom).offset(10)
            make.height.equalTo((MainScreenWidth - 30) + 20)
        }
        
        lineDesLabel.snp.makeConstraints { (make) in
            make.left.equalTo(collectionView.snp_left)
            make.top.equalTo(collectionView.snp_bottom).offset(10.0)
            make.width.equalTo(collectionView)
        }
        
        botLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1.0)
            make.bottom.equalTo(0)
        }
    }
}

extension TrendingLineCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lineData?.line_pics?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TrendingLinePicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingLinePicCell", for: indexPath) as! TrendingLinePicCell
        cell.logoUrl = self.lineData?.line_pics?[indexPath.row]
        return cell
    }
    
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //最小item间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (MainScreenWidth - 30) / 3
        return CGSize.init(width: size, height: size)
    }
}
