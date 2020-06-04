//
//  SubscripHeaderView.swift
//  YouTube
//
//  Created by Turbo on 2020/5/27.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class SubscripHeaderView: UIView {
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    private func createUI(){
        backgroundColor = UIColor.white
        addSubview(scrollView)
    }
    
    private func setupUIFrame() {
        scrollView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    func fillAuthData() {
        let list = 0...8
        for idx in list {
            let authImg = "channel" + String(idx + 1)
            let imageView = UIImageView(image: UIImage(named: authImg))
            imageView.layer.cornerRadius = 25
            imageView.layer.masksToBounds = true
            imageView.frame = CGRect(x: 15 + idx * (50 + 15), y: 25, width: 50, height: 50)
            scrollView.addSubview(imageView)
            scrollView.contentSize = CGSize(width: 65 * list.count + 15, height: 50)
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
}
