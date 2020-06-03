//
//  VedioData.swift
//  YouTube
//
//  Created by Turbo on 2020/5/27.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import HandyJSON

struct VedioData: HandyJSON {
    var vedioImgUrl: String!
    var title: String!
    var vedioAuth: String!
    var authLogo: String!
    
    var playersNum: String!
    var createTime: String!
    var vedioDesc: String!
    var link: VedioLink!
}

struct VedioLink: HandyJSON {
    var link_id: Int?
    var create_time: String?
    var link_name: String?
    var from: String?
    var amount: String?
}
