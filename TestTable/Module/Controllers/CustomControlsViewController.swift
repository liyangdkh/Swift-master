//
//  CustomControlsViewController.swift
//  TestTable
//
//  Created by liyang on 16/5/19.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class CustomControlsViewController: BaseViewController {
    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        super.viewDidLoad()
        self.title = "Custom Controls"
        self.setupButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupButton() {
        let title = ["Alert", "Actionsheet"]
        for i in 0...1 {
            let button = UIButton(frame: CGRectMake(80, CGFloat(84 + i*70), SCREEN_WIDTH - 160, 50))
            button.tag = 789 + i
            button.setTitle(title[i], forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.backgroundColor = UIColor.greenColor()
            button.addTarget(self, action: #selector(buttonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(button)
        }
    }
    
    func buttonSEL(button: UIButton) {
        if button.tag == 789 {
            let custom = CustomAlertView(title: "提示", content: "这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗这是一个测试弹窗", cancelButton: "取消", other: "确定")
            custom.alertBlock = { (index) in
                print(index)
            }
        } else if button.tag == 790 {
            let action = CustomActionSheet(title: "actionSheet 测试", cancelTitle: "取消", destructiveButtonTitle: "按钮1", others: "测试按钮1", "测试按钮2", "测试按钮3", "测试按钮4")
            action.actionBlock = { (index) in
                print("Touched button at index of \(index)")
            }
        }
    }
}
