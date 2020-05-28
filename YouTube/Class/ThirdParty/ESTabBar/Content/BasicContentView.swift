//
//  BasicContentView.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class BasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.darkGray
        highlightTextColor = UIColor(red: 248.0/255.0, green: 8.0/255.0, blue: 42.0/255.0, alpha: 1.0)
        iconColor = UIColor.darkGray
        highlightIconColor = UIColor(red: 248.0/255.0, green: 8.0/255.0, blue: 42.0/255.0, alpha: 1.0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
