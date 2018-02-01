//
//  SDTableDataSource.swift
//  TestTable
//
//  Created by liyang on 16/5/16.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class SDTableDataSource: NSObject, UITableViewDataSource {
    
    var datas: NSMutableArray!
    
    override init() {
        super.init()
        datas = NSMutableArray.init(capacity: 0)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SDTableViewCell.cellId(), forIndexPath: indexPath) as! SDTableViewCell
        cell.configureCell(datas[indexPath.row] as! NSDictionary)
        return cell
    }
}
