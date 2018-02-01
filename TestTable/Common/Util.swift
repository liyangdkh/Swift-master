//
//  Util.swift
//  TestTable
//
//  Created by liyang on 16/5/19.
//  Copyright © 2016年 dashang. All rights reserved.
//

import Foundation

class Util: NSObject {
    
    class func fetchJsonData(fileName: String) -> NSDictionary {
        let jsonPath = NSBundle.mainBundle().resourcePath?.stringByAppendingString("/" + fileName)
        let jsonDic = try! NSJSONSerialization.JSONObjectWithData(NSData(contentsOfFile: jsonPath!)!, options: NSJSONReadingOptions.MutableLeaves)
        return jsonDic as! NSDictionary
    }
}
