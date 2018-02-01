//
//  AddressView.swift
//  TestTable
//
//  Created by liyang on 16/5/18.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class AddressView: UIView {
    
    var backView1: UIView!
    var addressTable: UITableView!
    var areaScrollView: UIScrollView!
    var backBtn: UIButton!
    var fetchAddressBlock: (() -> Void)!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.colorWithHex(0xf2f2f2)
        backBtn = UIButton(frame: CGRectMake(5, 5, 40, 30))
        backBtn.tag = 9998
        backBtn.hidden = true
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(13.0)
        backBtn.addTarget(self, action: #selector(self.backBtnSel(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(backBtn)
        
        let closeBtn = UIButton(frame: CGRectMake(SCREEN_WIDTH - 45, 5, 40, 30))
        closeBtn.tag = 9999
        closeBtn.setTitle("关闭", forState: UIControlState.Normal)
        closeBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        closeBtn.titleLabel?.font = UIFont.systemFontOfSize(13.0)
        closeBtn.addTarget(self, action: #selector(self.backBtnSel(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(closeBtn)
        
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 40))
        titleLabel.font = UIFont.systemFontOfSize(16.0)
        titleLabel.text = "配送至"
        titleLabel.textColor = UIColor.lightGrayColor()
        titleLabel.center = CGPointMake(SCREEN_WIDTH/2, 20)
        titleLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(titleLabel)
        
        let line = UIView(frame: CGRectMake(0, 39, SCREEN_WIDTH, 0.5))
        line.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(line)
        
        backView1 = UIView(frame: CGRectMake(0, 40, SCREEN_WIDTH, self.height - 40))
        backView1.backgroundColor = UIColor.grayColor()
        self.addSubview(backView1)
        
        addressTable = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, backView1.height - 50), style: UITableViewStyle.Plain)
        addressTable.tag = 1987
        addressTable.rowHeight = 50
        addressTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "address")
        addressTable.tableFooterView = UIView.init()
        backView1.addSubview(addressTable)
        
        let bottomBtn = UIButton(type: UIButtonType.RoundedRect)
        bottomBtn.tag = 9997
        bottomBtn.frame = CGRectMake(0, backView1.height - 50, SCREEN_WIDTH, 50)
        bottomBtn.backgroundColor = UIColor.redColor()
        bottomBtn.setTitle("选择其他地址", forState: UIControlState.Normal)
        bottomBtn.addTarget(self, action: #selector(self.backBtnSel(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        backView1.addSubview(bottomBtn)
        
        areaScrollView = UIScrollView(frame: CGRectMake(SCREEN_WIDTH, 40, SCREEN_WIDTH, self.height - 40))
        areaScrollView.backgroundColor = UIColor.greenColor()
        self.addSubview(areaScrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backBtnSel(button: UIButton) {
        if button.tag == 9998 {
            UIView.animateWithDuration(0.25, animations: {
                self.backBtn.hidden = true
                self.backView1.left = 0.0
                self.areaScrollView.left = SCREEN_WIDTH
            })
        } else if button.tag == 9999 {
            UIView.animateWithDuration(0.25, animations: { 
                self.top = SCREEN_HEIGHT
                }, completion: { (Bool) in
                    self.removeFromSuperview()
            })
        } else if button.tag == 9997 {
            UIView.animateWithDuration(0.25, animations: {
                self.backBtn.hidden = false
                self.backView1.right = 0.0
                self.areaScrollView.right = SCREEN_WIDTH
                self.fetchAddressBlock()
            })
        }
    }
}
