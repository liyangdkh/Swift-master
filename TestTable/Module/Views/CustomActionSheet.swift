//
//  CustomActionSheet.swift
//  TestTable
//
//  Created by liyang on 16/5/19.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

typealias ActionSheetBlock = ((index: Int) -> Void)

class CustomActionSheet: UIView {
    
    var actionBlock: ActionSheetBlock?
    private var mask: UIView!
    
    init(title: String, cancelTitle: String, destructiveButtonTitle: String, others: String?...) {
        super.init(frame: CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 50))
        self.backgroundColor = UIColor.clearColor()
        var topValue = 0.0
        if !title.isEmpty {
            let titleLabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH, 0))
            titleLabel.backgroundColor = UIColor.whiteColor()
            titleLabel.font = UIFont.systemFontOfSize(14.0)
            titleLabel.textAlignment = NSTextAlignment.Center
            titleLabel.textColor = UIColor.lightGrayColor()
            titleLabel.numberOfLines = 0
            titleLabel.text = title
            self.addSubview(titleLabel)
            let titleSize = title.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH, 0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: titleLabel.font], context: nil).size
            titleLabel.height = ceil(titleSize.height) + 10
            topValue += Double(ceil(titleLabel.height))
        }

        for i in 0...(others.count - 1) {
            let btnTitle = others[others.count - 1 - i]
            if btnTitle == nil {
                continue
            }
            let button = UIButton(type: UIButtonType.RoundedRect)
            button.frame = CGRectMake(0, CGFloat(topValue), SCREEN_WIDTH, 50)
            button.tag = others.count - 1 - i + 2
            button.backgroundColor = UIColor.whiteColor()
            button.setTitle(btnTitle, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(18.0)
            button.addTarget(self, action: #selector(actionButtonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            button.addBottomBorderWithHeight(0.5, color: UIColor.colorWithHex(0xd2d2d2))
            self.addSubview(button)
            topValue += Double(button.height)
        }
        
        let destructiveBtn = UIButton(type: UIButtonType.RoundedRect)
        destructiveBtn.frame = CGRectMake(0, CGFloat(topValue), SCREEN_WIDTH, 50)
        destructiveBtn.tag = 1
        destructiveBtn.backgroundColor = UIColor.whiteColor()
        destructiveBtn.setTitle(destructiveButtonTitle, forState: UIControlState.Normal)
        destructiveBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        destructiveBtn.titleLabel?.font = UIFont.systemFontOfSize(18.0)
        destructiveBtn.addTarget(self, action: #selector(actionButtonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(destructiveBtn)
        
        let cancelBtn = UIButton(type: UIButtonType.RoundedRect)
        cancelBtn.frame = CGRectMake(0, destructiveBtn.bottom + 5, SCREEN_WIDTH, 50)
        cancelBtn.tag = 0
        cancelBtn.backgroundColor = UIColor.whiteColor()
        cancelBtn.setTitle(cancelTitle, forState: UIControlState.Normal)
        cancelBtn.setTitleColor(UIColor.colorWithHex(0xcd3700), forState: UIControlState.Normal)
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(18.0)
        cancelBtn.addTarget(self, action: #selector(actionButtonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(cancelBtn)
        
        self.height = cancelBtn.bottom
        
        mask = UIView(frame: UIScreen.mainScreen().bounds)
        mask.backgroundColor = UIColor.blackColor()
        mask.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureSel(_:)))
        mask.addGestureRecognizer(tap)
        
        UIApplication.sharedApplication().keyWindow?.addSubview(mask)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        show()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        UIView.animateWithDuration(0.25) { 
            self.mask.alpha = 0.5
            self.bottom = SCREEN_HEIGHT
        }
    }
    
    private func dismiss() {
        UIView.animateWithDuration(0.25, animations: { 
            self.mask.alpha = 0.0
            self.top = SCREEN_HEIGHT
        }){ [weak self] (completed) in
            self!.mask.removeFromSuperview()
            self!.removeFromSuperview()
        }
    }
    
    func actionButtonSEL(button: UIButton) {
        dismiss()
        if actionBlock != nil {
            actionBlock!(index: button.tag)
        }
    }
    
    func tapGestureSel(tap: UITapGestureRecognizer) {
        dismiss()
    }
}
