//
//  AddressTableDataSource.swift
//  TestTable
//
//  Created by liyang on 16/5/18.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class AddressTableDataSource: NSObject, UITableViewDataSource {
    
    var datas: NSMutableArray!

    override init() {
        super.init()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView.tag == 1987 {
            let cell = tableView.dequeueReusableCellWithIdentifier("address")
            let dic = datas[indexPath.row] as! NSDictionary
            cell?.textLabel?.text = dic["title"] as? String
            return cell!
        } else if tableView.tag == 1988 {
            let cell = tableView.dequeueReusableCellWithIdentifier("table1")
            cell?.textLabel?.text = datas[indexPath.row] as? String
            return cell!
        }
        return UITableViewCell.init()
    }
}
