//
//  CollectionCell.swift
//  TestTable
//
//  Created by liyang on 16/5/19.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    var headView: UIImageView!
    var title: UILabel!
    var des: UILabel!
    var sexView: UIImageView!
    
    class var cellId: String {
        get {
            return "collectionCellId"
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.colorWithHex(0xf2f2f2)
        self.layer.cornerRadius = 5.0
        headView = UIImageView(frame: CGRectMake(10, 10, 50, 50))
        headView.layer.cornerRadius = 5.0
        self.contentView.addSubview(headView)
        
        title = UILabel(frame: CGRectMake(headView.right + 5, 10, 100, 30))
        title.font = UIFont.systemFontOfSize(17.0)
        self.contentView.addSubview(title)
        
        sexView = UIImageView(frame: CGRectMake(title.right + 5, 10, 50, 30))
        sexView.image = UIImage(named: "male")
        self.contentView.addSubview(sexView)
        
        des = UILabel(frame: CGRectMake(5, headView.bottom + 20, SCREEN_WIDTH - 40 - 10, 40))
        des.font = UIFont.systemFontOfSize(20.0)
        des.textColor = UIColor.lightGrayColor()
        des.numberOfLines = 0
        self.contentView.addSubview(des)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: NSDictionary) {
        self.headView.sd_setImageWithURL(NSURL(string: data["avatar"] as! String), placeholderImage: UIImage(named: "message_single"))
        self.title.text = data["name"] as? String
        let titleRect = (data["name"] as? NSString)?.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH - 100, title.height), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: title.font], context: nil)
        title.width = (titleRect?.size.width)!
        sexView.left = title.right + 5
        
        des.text = data["des"] as? String
        let desRect = (data["des"] as? NSString)?.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH - 40 - 10, 0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: des.font], context: nil)
        des.height = (desRect?.size.height)!
    }
}
