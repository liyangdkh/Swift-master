//
//  CollectionTestViewController.swift
//  TestTable
//
//  Created by liyang on 16/5/19.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class CollectionTestViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var testDataSource: CollectionDataSource!
    var datas: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Collection Demo"
        self.automaticallyAdjustsScrollViewInsets = false
        self.setupCollectionView()
        self.fetchJsonData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupCollectionView() {
        testDataSource = CollectionDataSource.init()
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: CGRectMake(0, 84, SCREEN_WIDTH, 300), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.dataSource = testDataSource
        collectionView.delegate = self
        collectionView.scrollEnabled = true
        collectionView.pagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerClass(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.cellId)
        self.view.addSubview(collectionView)
    }
    
    func fetchJsonData() {
        let dic = Util.fetchJsonData("data.json")
        testDataSource.collectionDatas = (dic["datas"] as! NSMutableArray).mutableCopy() as! NSMutableArray
        collectionView.reloadData()
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(SCREEN_WIDTH - 40, 300)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 20, 0, 20)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}
