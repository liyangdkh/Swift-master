//
//  CustomAlertView.swift
//  TestTable
//
//  Created by liyang on 16/5/19.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

typealias AlertBlock = (btnIndex: Int) -> Void

class CustomAlertView: UIView {
    
    private var mask: UIView!
    var alertBlock: AlertBlock!
    
    init(title: String, content: String, cancelButton: String, other: String) {
        super.init(frame: CGRectMake(40, 0, SCREEN_WIDTH - 80, 0))
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        showAlert(title, content: content, cancelButton: cancelButton, other: other)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showAlert(title: String, content: String, cancelButton: String, other: String) {
        mask = UIView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        mask.backgroundColor = UIColor.blackColor()
        mask.alpha = 0.5
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureSEL(_:)))
        mask.addGestureRecognizer(tapGesture)
        var topValue = 10
        if !title.isEmpty {
            topValue = 50
            let titleLabel = UILabel(frame: CGRectMake(0, 0, self.width, 40))
            titleLabel.backgroundColor = UIColor.whiteColor()
            titleLabel.text = title
            titleLabel.font = UIFont.boldSystemFontOfSize(16.0)
            titleLabel.textAlignment = NSTextAlignment.Center
            self.addSubview(titleLabel)
            let line = UILabel(frame: CGRectMake(0, titleLabel.bottom - 0.5, self.width, 0.5))
            line.backgroundColor = UIColor.lightGrayColor()
            self.addSubview(line)
        }
        let contentLabel = UILabel(frame: CGRectMake(10, CGFloat(topValue), self.width - 20, 0))
        contentLabel.numberOfLines = 0
        contentLabel.text = content
        contentLabel.font = UIFont.systemFontOfSize(14.0)
        contentLabel.textColor = UIColor.grayColor()
        self.addSubview(contentLabel)
        
        let size = content.boundingRectWithSize(CGSizeMake(self.width - 20, 0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: contentLabel.font], context: nil).size
        contentLabel.height = size.height
        
        let bottomLine = UILabel(frame: CGRectMake(0, contentLabel.bottom + 10, self.width, 0.5))
        bottomLine.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(bottomLine)
        
        let button1 = UIButton(type: UIButtonType.RoundedRect)
        button1.tag = 666
        button1.titleLabel?.font = UIFont.systemFontOfSize(17.0)
        button1.frame = CGRectMake(0, contentLabel.bottom + 12, self.width, 40)
        button1.setTitle(cancelButton, forState: UIControlState.Normal)
        button1.setTitleColor(UIColor.colorWithHex(0xff4500), forState: UIControlState.Normal)
        button1.addTarget(self, action: #selector(buttonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(button1)
        
        self.height = button1.bottom + 2
        self.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
        
        if !other.isEmpty {
            button1.width = self.width/2
            let button2 = UIButton(type: UIButtonType.RoundedRect)
            button2.tag = 667
            button2.titleLabel?.font = UIFont.systemFontOfSize(17.0)
            button2.frame = CGRectMake(self.width/2, contentLabel.bottom + 12, self.width/2, 40)
            button2.setTitle(other, forState: UIControlState.Normal)
            button2.setTitleColor(UIColor.colorWithHex(0x8c8c8c), forState: UIControlState.Normal)
            button2.addTarget(self, action: #selector(buttonSEL(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(button2)
            
            let line2 = UILabel(frame: CGRectMake(self.width/2, bottomLine.bottom, 0.5, self.height - bottomLine.bottom))
            line2.backgroundColor = UIColor.lightGrayColor()
            self.addSubview(line2)
        }
        
        showAlert()
    }
    
    private func showAlert() {
        UIView.animateWithDuration(0.25) { 
            UIApplication.sharedApplication().keyWindow?.addSubview(self.mask)
            UIApplication.sharedApplication().keyWindow?.addSubview(self)
        }
    }
    
    private func dismiss() {
        UIView.animateWithDuration(0.25, animations: {
            self.alpha = 0.0
            self.mask.alpha = 0.0
            }) { [weak self] (Bool) in
                self!.removeFromSuperview()
                self!.mask.removeFromSuperview()
        }
    }
    
    func buttonSEL(button: UIButton) {
        self.dismiss()
        if alertBlock != nil {
            alertBlock(btnIndex: button.tag)
        }
    }
    
    func tapGestureSEL(tap: UITapGestureRecognizer) {
        dismiss()
    }
}
