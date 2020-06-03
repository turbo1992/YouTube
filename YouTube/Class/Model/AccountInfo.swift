//
//  AccountInfo.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import HandyJSON

struct AccountInfo: HandyJSON {
    var imageUrl: String!
    var userName: String!
    var phone: String!
    var balance: Float!
    var token: String!
    var memberData: AccountMemberData!
    var auth: AuthData!
}

struct AccountMemberData: HandyJSON {
    var id: Int?
    var create_time: String?
    var name: String?
}

struct AuthData: HandyJSON {
    var id: Int?
    var auth_num: String?
    var auth_address: String?
    var phone_num: String?
    var balance: String?
}
