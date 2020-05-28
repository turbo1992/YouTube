//
//  HttpClient.swift
//  YouTube
//
//  Created by Turbo on 2020/5/28.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

typealias ResponseBlock = (_ res: Any)->()

class HttpClient: NSObject {
    
    func getArticleList() {
        let urlStr = "http://112.74.55.99/api/v1/public/articleList"
        request(urlStr).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                print(json)
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
        }
    }
}
