//
//  YTBDefine.swift
//  YouTube
//
//  Created by Turbo on 2020/5/29.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
import SwiftyJSON
import Alamofire

let baseUrl = "http://112.74.55.99/api"

let fileService = baseUrl + "/v1/public/download?url="

let kAppMainColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)

let kAppMainTextGrayColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
let kAppMainRedColor = UIColor(red: 248.0/255.0, green: 8.0/255.0, blue: 42.0/255.0, alpha: 1.0)
let kAppMainGreenColor = UIColor(red: 35.0/255.0, green: 176.0/255.0, blue: 21.0/255.0, alpha: 1.0)
let kAppMainBlueColor = UIColor(red: 134.0/255.0, green: 186.0/255.0, blue: 248.0/255.0, alpha: 1.0)
let kAppMainGrayColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
let kAppDarkGrayColor = UIColor(red: 96.0/255.0, green: 96.0/255.0, blue: 96.0/255.0, alpha: 1.0)
let kAppLineGrayColor = UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1.0)
let kAppTextColor = UIColor(red: 68.0/255.0, green: 68.0/255.0, blue: 68.0/255.0, alpha: 1.0)
let kAppDarkTextColor = UIColor(red: 18.0/255.0, green: 18.0/255.0, blue: 18.0/255.0, alpha: 1.0)

let kAppNavBarColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
let kAppTabBarColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)

let kAppTabBarTintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
let kAppTabbarUnselColor = UIColor(red: 91/255.0, green: 14.0/255.0, blue: 13.0/255.0, alpha: 1.0)

let MainScreenWidth = UIScreen.main.bounds.width
let MainScreenHeight = UIScreen.main.bounds.height


let isIphoneX = MainScreenHeight >= 812 ? true : false

let NavBarHeight : CGFloat = isIphoneX ? 88 : 64
let TabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49
