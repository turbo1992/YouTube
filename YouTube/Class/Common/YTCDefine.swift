//
//  YTCDefine.swift
//  YouTube
//
//  Created by Turbo on 2020/5/29.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

let baseUrl = "http://112.74.55.99/api"

let fileService = baseUrl + "/v1/public/download?url="

enum UserType:Int {
    case admin = 0
    case shop = 1
    case wechat = 2
    case common = 3
}

enum UserStatus:String {
    case unlogin = "UNLOGIN"
    case online = "ONLINE"
    case offline = "OFFLINE"
    case forbidden = "FORBIDDEN"
    case other = "OTHER"
}

enum VedioPlayState:Int {
    case closed = 1001
    case playing = 1002
    case advertisement = 1003
    case watting = 1004
    case finished = 1005
}
