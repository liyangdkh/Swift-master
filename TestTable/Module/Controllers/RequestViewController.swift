//
//  RequestViewController.swift
//  TestTable
//
//  Created by liyang on 16/6/2.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class RequestViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func requestData() {
        let url = "http://192.168.1.115:8080/rest/AppInfoService/updateAppInfo";
        let params = ["device_type":"iOS","appVersion":"1.1.1.1","uuid":"123456"]
        DataRequest.requestDataWithUrl(url, parameter: params, success: { (successDic) in
            print(successDic)
        }) { (error) in
            print(error)
        }
    }
}
