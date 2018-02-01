//
//  SDImageTestViewController.swift
//  TestTable
//
//  Created by liyang on 16/5/16.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class SDImageTestViewController: BaseViewController, UITableViewDelegate {
    
    var tableView: UITableView!
    var dataArray: NSMutableArray!
    var sdTableDataSource: SDTableDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.title = "SDWebImage Demo"
        self.setupTableView()
        self.fetchJsonData()
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func setupTableView() {
        sdTableDataSource = SDTableDataSource()
        tableView = UITableView(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64), style: UITableViewStyle.Plain)
        tableView.dataSource = sdTableDataSource
        tableView.delegate = self
        tableView.rowHeight = 60.0
        tableView.tableFooterView = UIView()
        tableView.registerClass(SDTableViewCell.self, forCellReuseIdentifier: SDTableViewCell.cellId())
        self.view.addSubview(tableView)
    }
    
    func fetchJsonData() {
        let jsonDic = Util.fetchJsonData("data.json")
        let array = jsonDic["datas"] as! NSMutableArray
        sdTableDataSource.datas = array.mutableCopy() as! NSMutableArray
        self.tableView.reloadData()
    }
    
    //MARK: UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
