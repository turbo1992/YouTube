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
        print("YouTube manager initilized")

        self.httpClient = HttpClient()
        self.vedioPlayState = VedioPlayState.closed.rawValue
        
        HostReach().reachabilityForInternetConnection()
    }
}
