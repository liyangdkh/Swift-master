//
//  AddressViewController.swift
//  TestTable
//
//  Created by liyang on 16/5/18.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class AddressViewController: BaseViewController, UIScrollViewDelegate, UITableViewDelegate {
    
    var segmental: UISegmentedControl!
    var backScrollView: UIScrollView!
    var addrView: AddressView!
    var addressDataSource: AddressTableDataSource!
    var addressDatas: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.setupSegmental()
        self.setupScrollView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupSegmental() {
        segmental = UISegmentedControl(items: ["商品","详情","评价"])
        segmental.frame = CGRectMake(0, 0, 120, 40)
        segmental.tintColor = UIColor.clearColor()
        segmental.selectedSegmentIndex = 0
        let selectedDic = [NSFontAttributeName: UIFont.systemFontOfSize(19.0), NSForegroundColorAttributeName: UIColor.colorWithHex(0x2eb252)]
        let unselectedDic = [NSFontAttributeName: UIFont.systemFontOfSize(16.0), NSForegroundColorAttributeName: UIColor.colorWithHex(0x666666)]
        segmental.setTitleTextAttributes(selectedDic, forState: UIControlState.Selected)
        segmental.setTitleTextAttributes(unselectedDic, forState: UIControlState.Normal)
        segmental.addTarget(self, action: #selector(self.segmentedSel(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.navigationItem.titleView = segmental
        
        let line = UIView.init(frame: CGRectMake(0, 41, 45, 1))
        line.backgroundColor = UIColor.redColor()
        line.tag = 1999
        segmental.addSubview(line)
    }
    
    func setupScrollView() {
        backScrollView = UIScrollView(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64))
        backScrollView.showsHorizontalScrollIndicator = false
        backScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT - 64)
        backScrollView.pagingEnabled = true
        backScrollView.delegate = self
        self.view.addSubview(backScrollView)
        self.setupProductViewIn(backScrollView)
        self.setupDetailView(backScrollView)
        self.setupCommentView(backScrollView)
    }
    
    //MARK: setup product view
    
    func setupProductViewIn(scrollView: UIScrollView) {
        let pView = ProductView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64))
        pView.desLabel.text = "商品页面"
        pView.selectionBlock = {[weak self] (tag: NSInteger) in
            self?.setupAddressView()
        }
        scrollView.addSubview(pView)
    }
    
    //MARK: setup address view
    
    func setupAddressView() {
        addressDatas = [["title":"辽宁省丹东市宽甸县"],["title":"广东省深圳市南山区国人大厦"],["title":"广东省深圳市宝安区沙井"]]
        addressDataSource = AddressTableDataSource.init()
        addrView = AddressView(frame: CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 400))
        addrView.addressTable.dataSource = addressDataSource
        addressDataSource.datas = addressDatas.mutableCopy() as! NSMutableArray
        addrView.addressTable.reloadData()
        addrView.fetchAddressBlock = {[weak self] () in
            let dic = Util.fetchJsonData("address.json")
            self?.allocNewTable(dic.allKeys)
        }
        UIApplication.sharedApplication().keyWindow?.addSubview(addrView)
        UIView.animateWithDuration(0.25) { 
            self.addrView.bottom = SCREEN_HEIGHT
        }
    }
    
    //MARK: setup detail view
    
    func setupDetailView(scrollView: UIScrollView) {
        let dView = DetailView.init(frame: CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64))
        dView.desLabel.text = "详情页面"
        scrollView.addSubview(dView)
    }
    
    //MARK: setup comment view
    
    func setupCommentView(scrollView: UIScrollView) {
        let cView = DetailView.init(frame: CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64))
        cView.desLabel.text = "评论页面"
        scrollView.addSubview(cView)
    }
    
    //MARK: segmentedControl SEL
    
    func segmentedSel(segmented: UISegmentedControl) {
        backScrollView.setContentOffset(CGPointMake(SCREEN_WIDTH*CGFloat(segmented.selectedSegmentIndex), 0), animated: true)
        let line = segmental.viewWithTag(1999)
        UIView.animateWithDuration(0.25) {
            line?.left = CGFloat(45*segmented.selectedSegmentIndex)
        }
    }
    
    func allocNewTable(datas: NSArray) {
        let table1 = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, addrView.height - 40))
        table1.tag = 1988
        addressDataSource.datas = datas.mutableCopy() as! NSMutableArray
        table1.dataSource = addressDataSource
        table1.delegate = self
        table1.rowHeight = 50.0
        table1.registerClass(UITableViewCell.self, forCellReuseIdentifier:"table1")
        table1.tableFooterView = UIView.init()
        addrView.areaScrollView.addSubview(table1)
    }
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let i = Int(scrollView.contentOffset.x / SCREEN_WIDTH)
        segmental.selectedSegmentIndex = i
        let line = segmental.viewWithTag(1999)
        UIView.animateWithDuration(0.25) { 
            line?.left = CGFloat(45*i)
        }
    }
    
    //MARK: UITableViewDelegate
    
}
