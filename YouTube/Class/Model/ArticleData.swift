//
//  ArticleData.swift
//  YouTube
//
//  Created by Turbo on 2020/5/29.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import HandyJSON

struct ArticleData: HandyJSON {
    var title: String!
    var coverImgUrl: String!
    var authUrl: String!
    var userName: String!
    var list: [HistoryArticleListData]!
}

struct HistoryArticleListData: HandyJSON {
    var create_time: String?
    var count: Int?
    var total: Int?
    var list_id: Int?
}
