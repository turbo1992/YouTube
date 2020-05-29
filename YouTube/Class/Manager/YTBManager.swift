//
//  YTBManager.swift
//  YouTube
//
//  Created by Turbo on 2020/5/28.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class YTBManager: NSObject {
    static let shared = YTBManager()
    
    var httpClient: HttpClient!
    var vedioPlayState: Int!
    
    private override init() {
        super.init()
        self.httpClient = HttpClient()
        self.vedioPlayState = VedioPlayState.closed.rawValue
        print("YouTube manager initilized")
    }
}
