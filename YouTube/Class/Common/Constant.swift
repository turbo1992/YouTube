//
//  Constant.swift
//  YouTube
//
//  Created by Turbo on 2020/6/2.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

enum Tip: String {
    case NO_NETWORK = "网络无连接"
    case REQUEST_FAILED = "请求失败"
}

enum Retcode: String {
    case SUCCESS = "success"
    case DB_ERROR = "dbError"
    case TIME_OUT = "timeout"
    case RECORD_NOT_FOUND = "recordNotFound"
    case PARA_ERR = "paraErr"
    case SIGN_ERR = "signErr"
    case FORBIDDEN = "forbidden"
    case UNKNOWN = "unknown"
}

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
