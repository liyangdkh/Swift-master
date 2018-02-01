//
//  TestTableDataSource.swift
//  TestTable
//
//  Created by liyang on 16/5/6.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

typealias CallBackFunc = (selectIndex: Int) -> Void

protocol TestButtonDelegate: NSObjectProtocol {
    func testDelegateBtnClickedAtIndex(index: NSInteger)
}

class TestTableDataSource: NSObject,UITableViewDataSource {
    
    var testDatas: NSMutableArray!
    var btnCallBack:CallBackFunc?
    weak var delegate: TestButtonDelegate?
    
    func configureBtnClosure(btnSelector:CallBackFunc) {
        btnCallBack = btnSelector
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testDatas.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCellWithIdentifier(TestTableViewCell.testCellId(), forIndexPath: indexPath) as! TestTableViewCell)
        let data = (testDatas[indexPath.row] as! NSDictionary)
        cell.configCell(data)
        cell.btn.tag = indexPath.row
        cell.btn.addTarget(self, action: #selector(TestTableDataSource.buttonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.delegateBtn.tag = indexPath.row;
        cell.delegateBtn.addTarget(self, action: #selector(TestTableDataSource.delegateButtonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func buttonSEL(button: UIButton) {
        btnCallBack!(selectIndex:button.tag)
    }
    
    func delegateButtonSEL(btn: UIButton) {
        delegate?.testDelegateBtnClickedAtIndex(btn.tag)
    }
}
