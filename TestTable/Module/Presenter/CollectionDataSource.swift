//
//  CollectionDataSource.swift
//  TestTable
//
//  Created by liyang on 16/5/19.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class CollectionDataSource: NSObject, UICollectionViewDataSource {

    var collectionDatas: NSMutableArray!

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return collectionDatas.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCellWithReuseIdentifier(CollectionCell.cellId, forIndexPath: indexPath) as! CollectionCell)
        let data = collectionDatas[indexPath.section] as! NSDictionary
        cell.configureCell(data)
        return cell
    }
}
