//
//  UIColor+Extensions.swift
//  TestTable
//
//  Created by liyang on 16/5/13.
//  Copyright © 2016年 dashang. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func colorWithHex(hexColor: u_long) -> UIColor {
        let redValue = CGFloat((hexColor & 0xFF0000) >> 16)/255.0
        let greenValue = CGFloat((hexColor & 0xFF00) >> 8)/255.0
        let blueValue = CGFloat(hexColor & 0xFF)/255.0
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    class func colorWithHex(hexColor: u_long, alpha: CGFloat) -> UIColor {
        let redValue = CGFloat((hexColor & 0xFF0000) >> 16)/255.0
        let greenValue = CGFloat((hexColor & 0xFF00) >> 8)/255.0
        let blueValue = CGFloat(hexColor & 0xFF)/255.0
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    }
}
