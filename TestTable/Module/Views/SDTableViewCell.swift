//
//  SDTableViewCell.swift
//  TestTable
//
//  Created by liyang on 16/5/16.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class SDTableViewCell: UITableViewCell {
    
    var headImage: UIImageView!
    var titleLabel: UILabel!
    var desLabel: UILabel!
    var dateLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        headImage = UIImageView(frame: CGRectMake(10, 10, 40, 40))
        headImage.image = UIImage(named: "message_single")
        headImage.layer.cornerRadius = 5.0
        self.contentView.addSubview(headImage)
        
        titleLabel = UILabel(frame: CGRectMake(headImage.right + 10, 10, SCREEN_WIDTH - 80, 20))
        titleLabel.font = UIFont.systemFontOfSize(18.0)
        self.contentView.addSubview(titleLabel)
        
        desLabel = UILabel(frame: CGRectMake(headImage.right + 10, titleLabel.bottom, SCREEN_WIDTH - 80, 20))
        desLabel.font = UIFont.systemFontOfSize(13.0)
        desLabel.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(desLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    class func cellId() -> String {
        return "sdTestCell"
    }
    
    func configureCell(dic: NSDictionary) {
        self.headImage.sd_setImageWithURL(NSURL(string: (dic["avatar"] as! String)), placeholderImage: UIImage(named: "message_single"))
        self.titleLabel.text = (dic["name"] as! String)
        self.desLabel.text = (dic["des"] as! String)
    }
}
