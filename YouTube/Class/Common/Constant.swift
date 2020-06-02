//
//  Constant.swift
//  YouTube
//
//  Created by Turbo on 2020/6/2.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

let NO_NETWORK = "网络无连接"

let REQUEST_FAILED = "请求失败"

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
