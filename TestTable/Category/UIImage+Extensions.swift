//
//  UIImage+Extensions.swift
//  TestTable
//
//  Created by liyang on 16/6/12.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit
import Foundation

enum MessageDirection {
    case send
    case receive
}

extension UIImage {
    
    func msgImage(sizeToFit: CGSize, msgDirection: MessageDirection) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(sizeToFit, false, 0.0)
        let context = UIGraphicsGetCurrentContext();
        if(msgDirection == MessageDirection.receive)
        {
            let path111 = UIBezierPath(roundedRect:CGRectMake(10 , 0, sizeToFit.width - 10, sizeToFit.height),byRoundingCorners:UIRectCorner.AllCorners, cornerRadii:CGSizeMake(5, 5))
            
            let path = CGPathCreateMutable();
            CGPathMoveToPoint(path, nil, 10, 15);
            CGPathAddLineToPoint(path, nil, 0, 20);
            CGPathAddLineToPoint(path, nil, 10, 25);
            CGPathAddPath(path, nil, path111.CGPath);
            CGContextAddPath(context, path);
            CGContextClip(context);
        } else {
            let path111 = UIBezierPath(roundedRect:CGRectMake(0 , 0, sizeToFit.width - 10, sizeToFit.height),byRoundingCorners:UIRectCorner.AllCorners, cornerRadii:CGSizeMake(5, 5))
            
            let path = CGPathCreateMutable();
            CGPathMoveToPoint(path, nil, sizeToFit.width - 10, 15);
            CGPathAddLineToPoint(path, nil, sizeToFit.width, 20);
            CGPathAddLineToPoint(path, nil, sizeToFit.width - 10, 25);
            CGPathAddPath(path, nil, path111.CGPath);
            CGContextAddPath(context, path);
            CGContextClip(context);
        }
    
        drawInRect(CGRectMake(0, 0, sizeToFit.width, sizeToFit.height))
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
    
    func image(sizeToFit: CGSize, cornerRadius: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(sizeToFit, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath(roundedRect: CGRectMake(0 , 0, sizeToFit.width, sizeToFit.height), byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSizeMake(cornerRadius, cornerRadius))
        CGContextAddPath(context, path.CGPath)
        CGContextClip(context)
        drawInRect(CGRectMake(0, 0, sizeToFit.width, sizeToFit.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
