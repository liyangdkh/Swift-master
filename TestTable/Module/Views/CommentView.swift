//
//  CommentView.swift
//  TestTable
//
//  Created by liyang on 16/5/18.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class CommentView: UIView {
    
    var desLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        desLabel = UILabel(frame: CGRectMake(10, 10, SCREEN_WIDTH - 20, 30))
        desLabel.textColor = UIColor.grayColor()
        desLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(desLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
