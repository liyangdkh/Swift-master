//
//  DataRequest.swift
//  TestTable
//
//  Created by liyang on 16/5/12.
//  Copyright © 2016年 dashang. All rights reserved.
//

import Foundation

class DataRequest: NSObject {
    
    class func requestParams(parameter: NSDictionary) -> NSDictionary {
        let data = try! NSJSONSerialization.dataWithJSONObject(parameter, options: NSJSONWritingOptions.PrettyPrinted)
        let paramString = NSString.init(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
        
        //if has login user,please write token
        
        let params = ["appInfoJson": paramString!]
        return params as NSDictionary
    }
    
    class func requestDataWithUrl(url: String!,
                                  parameter: NSDictionary!,
                                  success: ((NSDictionary) -> Void),
                                  failed: ((NSError) -> Void)) -> NSURLSessionDataTask
    {
        let parameters = self.requestParams(parameter)
        return HttpSessionManager.sharedSession.POST(url, parameters: parameters, success: { (task: NSURLSessionDataTask, respondObject: AnyObject?) in
            success(respondObject as! NSDictionary)
        }) { (task: NSURLSessionDataTask?, error:NSError) in
            failed(error)
        }!
    }
}
