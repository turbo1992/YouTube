//
//  HostReach.swift
//  YouTube
//
//  Created by Turbo on 2020/6/2.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import Reachability

class HostReach: NSObject {
    
    public func reachabilityForInternetConnection() {
        
        let reachability = try! Reachability()
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        
        reachability.whenUnreachable = { _ in
            print("Not reachable")
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
}
