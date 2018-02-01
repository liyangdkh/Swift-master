//
//  UIView+Extensions.swift
//  TestTable
//
//  Created by liyang on 16/5/10.
//  Copyright © 2016年 dashang. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            var newFrame: CGRect = self.frame
            newFrame.origin = newValue
            self.frame = newFrame
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var newFrame: CGRect = self.frame
            newFrame.size = newValue
            self.frame = newFrame
        }
    }
    
    var bottomRight: CGPoint {
        let x: CGFloat = self.frame.origin.x + self.frame.size.width
        let y: CGFloat = self.frame.origin.y + self.frame.size.height
        return CGPointMake(x, y)
    }
    
    var bottomLeft: CGPoint {
        let x: CGFloat = self.frame.origin.x
        let y: CGFloat = self.frame.origin.y + self.frame.size.height
        return CGPointMake(x, y)
    }
    
    var topRight: CGPoint {
        let x: CGFloat = self.frame.origin.x + self.frame.size.width
        let y: CGFloat = self.frame.origin.y
        return CGPointMake(x, y)
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var newframe: CGRect = self.frame
            newframe.size.height = newValue
            self.frame = newframe
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var newframe: CGRect = self.frame
            newframe.size.width = newValue
            self.frame = newframe
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var newframe: CGRect = self.frame
            newframe.origin.y = newValue
            self.frame = newframe
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var newframe: CGRect = self.frame
            newframe.origin.x = newValue
            self.frame = newframe
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            var newframe: CGRect = self.frame
            newframe.origin.y = newValue - self.frame.size.height
            self.frame = newframe
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            let delta: CGFloat = newValue - (self.frame.origin.x + self.frame.size.width)
            var newframe: CGRect = self.frame
            newframe.origin.x += delta
            self.frame = newframe
        }
    }
    
    func addTopBorderWithHeight(height: CGFloat, color: UIColor) {
        let layer = CALayer()
        layer.frame = CGRectMake(0, 0, self.width, height)
        layer.backgroundColor = color.CGColor
        self.layer.addSublayer(layer)
    }
    
    func addBottomBorderWithHeight(height: CGFloat, color: UIColor) {
        let layer = CALayer()
        layer.frame = CGRectMake(0, self.frame.size.height - height, self.width, height)
        layer.backgroundColor = color.CGColor
        self.layer.addSublayer(layer)
    }
    
    func addTopBottomBorderWithHeight(height: CGFloat, color: UIColor) {
        self.addTopBorderWithHeight(height, color: color)
        self.addBottomBorderWithHeight(height, color: color)
    }
    
    func addBorderCorners(borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        let layer = self.layer
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        layer.cornerRadius = cornerRadius
    }
    
    func moveBy(delta: CGPoint) {
        var newCenter = self.center
        newCenter.x += delta.x
        newCenter.y += delta.y
        self.center = newCenter
    }
    
    func scaleBy(scaleFactor: CGFloat) {
        var newFrame = self.frame
        newFrame.size.width *= scaleFactor
        newFrame.size.height *= scaleFactor
        self.frame = newFrame
    }
    
    func fitInSize(aSize: CGSize) {
        var scale = 0.0 as CGFloat
        var newFrame = self.frame
        if newFrame.size.height > 0 && newFrame.size.height > aSize.height {
            scale = aSize.height / newFrame.size.height
            newFrame.size.width *= scale
            newFrame.size.height *= scale
        }
        
        if newFrame.size.width > 0 && newFrame.size.width >= aSize.width {
            scale = aSize.width / newFrame.size.width
            newFrame.size.width *= scale
            newFrame.size.height *= scale
        }
        self.frame = newFrame
    }
    
    func removeViewByTag(viewTag: NSInteger) {
        for aView: UIView in self.subviews {
            if aView.tag == tag {
                aView.removeFromSuperview()
            }
        }
    }
    
    class func animationOptionsForCurve(curve: UIViewAnimationCurve) -> UIViewAnimationOptions {
        if curve == UIViewAnimationCurve.EaseInOut {
            return UIViewAnimationOptions.CurveEaseInOut
        } else if curve == UIViewAnimationCurve.EaseIn {
            return UIViewAnimationOptions.CurveEaseIn
        } else if curve == UIViewAnimationCurve.EaseOut {
            return UIViewAnimationOptions.CurveEaseOut
        } else if curve == UIViewAnimationCurve.Linear {
            return UIViewAnimationOptions.CurveLinear
        }
        return UIViewAnimationOptions.CurveEaseInOut
    }
}
