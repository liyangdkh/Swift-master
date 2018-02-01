//
//  TestTableViewCell.swift
//  TestTable
//
//  Created by liyang on 16/5/6.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var desLabel: UILabel!
    var btn: UIButton!
    var delegateBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    
    class func testCellId() -> String {
        return "TestCell";
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel(frame: CGRectMake(10, 10, SCREEN_WIDTH - 20, 25));
        titleLabel.font = UIFont.boldSystemFontOfSize(20.0)
        self.contentView.addSubview(titleLabel)
        
        desLabel = UILabel(frame: CGRectMake(15, titleLabel.bottom + 5, SCREEN_WIDTH - 30, 20))
        desLabel.font = UIFont.systemFontOfSize(16.0)
        desLabel.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(desLabel)
        
        btn = UIButton(type: UIButtonType.System)
        btn.frame = CGRectMake(titleLabel.right + 10, 20, 100, 50)
        btn.backgroundColor = UIColor.colorWithHex(0x9932CC)
        btn.titleLabel?.font = UIFont.systemFontOfSize(18.0)
        btn.setTitle("TestBlock", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        self.contentView.addSubview(btn)
        
        delegateBtn = UIButton(type: UIButtonType.System)
        delegateBtn.frame = CGRectMake(btn.right + 10, 20, 120, 50)
        delegateBtn.backgroundColor = UIColor.colorWithHex(0xADFF2F)
        delegateBtn.titleLabel?.font = UIFont.systemFontOfSize(18.0)
        delegateBtn.setTitle("TestDelegate", forState: UIControlState.Normal)
        delegateBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        self.contentView.addSubview(delegateBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(dic: NSDictionary) {
        self.titleLabel.text = (dic["title"] as! String)
        self.desLabel.text = (dic["des"] as! String)
    }
}
