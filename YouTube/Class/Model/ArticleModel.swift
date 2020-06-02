//
//  ArticleModel.swift
//  YouTube
//
//  Created by Turbo on 2020/6/2.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import HandyJSON

struct ArticleModel: HandyJSON {
    var msg: String?
    var code: String?
    var data: ArticleDataModel?
}

struct ArticleDataModel: HandyJSON {
    var total: Int?
    var marker: String?
    var isLast: Bool?
    var list: [ArticleInfo]?
}

struct ArticleInfo: HandyJSON {
    var id: Int?
    var create_time: String?
    var title: String?
    var image_url: String?
    var content: String?
}
