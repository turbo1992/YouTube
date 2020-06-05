//
//  TrendingLineData.swift
//  YouTube
//
//  Created by Turbo on 2020/6/5.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import HandyJSON

struct TrendingLineData: HandyJSON {
    var logo_url: String?
    var user_name: String?
    var line_pics: Array<String>?
    var line_des: String?
    var time: String?
}
