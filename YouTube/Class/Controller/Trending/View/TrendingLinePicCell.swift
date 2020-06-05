//
//  TrendingLinePicCell.swift
//  YouTube
//
//  Created by Turbo on 2020/6/5.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class TrendingLinePicCell: UICollectionViewCell {
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 5
        self.imageView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var logoUrl :String? {
        didSet {
            guard logoUrl != nil else {return}
            self.imageView.image = UIImage(named: logoUrl!)
        }
    }
}
