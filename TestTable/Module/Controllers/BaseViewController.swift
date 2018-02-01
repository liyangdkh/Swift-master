//
//  BaseViewController.swift
//  TestTable
//
//  Created by liyang on 16/5/23.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
//        let backBtn = UIButton(type: UIButtonType.Custom)
//        backBtn.frame = CGRectMake(0, 0, 25, 25)
//        backBtn.setImage(UIImage(named: "Back"), forState: UIControlState.Normal)
//        backBtn.setImage(UIImage(named: "BackSelected"), forState: UIControlState.Highlighted)
//        backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10)
//        backBtn.addTarget(self, action: #selector(backBtnItemClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func backBtnItemClicked(barItem: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
