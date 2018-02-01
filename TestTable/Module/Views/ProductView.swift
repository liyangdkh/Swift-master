//
//  ProductView.swift
//  TestTable
//
//  Created by liyang on 16/5/18.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class ProductView: UIView {
    
    var desLabel: UILabel!
    var selectionBlock: ((NSInteger) -> Void)!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let addressBtn = UIButton(type: UIButtonType.RoundedRect)
        addressBtn.tag = 1000
        addressBtn.frame = CGRectMake(100, 50, SCREEN_WIDTH - 200 , 50)
        addressBtn.setTitle("选择地址", forState: UIControlState.Normal)
        addressBtn.backgroundColor = UIColor.purpleColor()
        addressBtn.addTarget(self, action: #selector(self.buttonSel(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(addressBtn)
        
        desLabel = UILabel(frame: CGRectMake(10, 10, SCREEN_WIDTH - 20, 30))
        desLabel.textColor = UIColor.grayColor()
        desLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(desLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonSel(button: UIButton) {
        selectionBlock(button.tag)
    }
}
