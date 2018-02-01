//
//  DataRequest.swift
//  TestTable
//
//  Created by liyang on 16/5/11.
//  Copyright © 2016年 dashang. All rights reserved.
//

import Foundation

class HttpSessionManager: AFHTTPSessionManager {
    
    class var sharedSession :HttpSessionManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: HttpSessionManager? = nil
        }
        
        dispatch_once(&Static.onceToken, { () -> Void in
            let url:NSURL = NSURL(string: BASE_URL)!
            Static.instance = HttpSessionManager(baseURL: url)
            Static.instance!.requestSerializer.timeoutInterval = 30
            Static.instance!.requestSerializer.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
            Static.instance!.responseSerializer.acceptableContentTypes = NSSet.init(object: "application/json") as? Set<String>
        })
        return Static.instance!
    }
}
