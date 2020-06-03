//
//  HttpClient.swift
//  YouTube
//
//  Created by Turbo on 2020/5/28.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
    case put
}

class HttpClient {
    class func request(_ type: MethodType = .post, url: String, params: [String : Any]?, success: @escaping (_ data: Data)->(), failure: ((Int?, String) ->Void)?) {
        
        var method = HTTPMethod.get
        
        switch type {
        case .get:
            method = HTTPMethod.get
        case .post:
            method = HTTPMethod.post
        case .put:
            method = HTTPMethod.put
        }

        Alamofire.request(url, method: method, parameters: params).responseData { (response) in
            switch response.result {
            case let .success(response):
                success(response)
            case let .failure(error):
                failureHandle(failure: failure, errorCode: nil, message: error.localizedDescription)
            }
        }
        
        func failureHandle(failure: ((Int?, String) ->Void)? , errorCode: Int?, message: String) {
            failure?(errorCode ,message)
        }
    }
}

extension HttpClient {
    // GET
    class func GET(url: String, params: [String : Any]?, success: @escaping (_ data: Data)->(), failure: ((Int?, String) ->Void)?) {
        HttpClient.request(.get, url: url, params: params, success: success, failure: failure)
    }
    // POST
    class func POST(url: String, params: [String : Any]?, success: @escaping (_ data: Data) ->(), failure: ((Int?, String) ->Void)?) {
        HttpClient.request(.post, url: url, params: params, success: success, failure: failure)
    }
    // PUT
    class func PUT(url: String, params: [String : Any]?, success: @escaping (_ data: Data) ->(), failure: ((Int?, String) ->Void)?) {
        HttpClient.request(.put, url: url, params: params, success: success, failure: failure)
    }
    
    
    // 获取文章列表
    class func GetArticleList(success: @escaping (_ data: Data)->(), failure: ((Int?, String) ->Void)?) {
        let url = baseUrl + "/v1/public/articleList"
        GET(url: url, params: nil, success: success, failure: failure)
    }
}
