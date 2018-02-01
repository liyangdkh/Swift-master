//
//  BannerViewController.swift
//  TestTable
//
//  Created by liyang on 16/5/13.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class BannerViewController: BaseViewController, UIScrollViewDelegate {
    
    var backScrollView: UIScrollView!
    var leftImageView: UIImageView!
    var midImageView: UIImageView!
    var rightImageView: UIImageView!
    var pageControl: UIPageControl!
    var images: NSArray!
    var currentIndex: NSInteger = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.title = "Banner Test"
        images = ["0", "1", "2", "3", "4"]
        self.setupScrollView()
        self.view.addSubview(self.backScrollView)
        self.setupPageControl()
        self.setupImageView()
    }
    
    //MARK: setup scrollview
    
    func setupScrollView() {
        backScrollView = UIScrollView(frame: CGRectMake(0, 64, SCREEN_WIDTH, 200))
        backScrollView.backgroundColor = UIColor.grayColor()
        backScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, 200)
        backScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
        backScrollView.pagingEnabled = true
        backScrollView.showsHorizontalScrollIndicator = false
        backScrollView.delegate = self
        self.view.addSubview(backScrollView)
    }
    
    //MARK: setup imageview
    
    func setupImageView() {
        leftImageView = UIImageView(frame: CGRectMake(0, 0, SCREEN_WIDTH, 200))
        leftImageView.userInteractionEnabled = true
        leftImageView.image = UIImage(named: images[0] as! String)
        backScrollView.addSubview(leftImageView)
        
        midImageView = UIImageView(frame: CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, 200))
        midImageView.userInteractionEnabled = true
        midImageView.image = UIImage(named: images[1] as! String)
        backScrollView.addSubview(midImageView)
        
        rightImageView = UIImageView(frame: CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, 200))
        rightImageView.userInteractionEnabled = true
        rightImageView.image = UIImage(named: images[2] as! String)
        backScrollView.addSubview(rightImageView)
    }
    
    func setupPageControl() {
        pageControl = UIPageControl.init()
        let size = pageControl.sizeForNumberOfPages(images.count)
        pageControl.bounds = CGRectMake(0, 0, size.width, size.height)
        pageControl.center = CGPointMake(SCREEN_WIDTH/2, backScrollView.bottom + 20)
        pageControl.numberOfPages = images.count
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.userInteractionEnabled = false
        self.view.addSubview(pageControl)
    }
    
    func reloadImage(offset: CGPoint) {
        if offset.x == 0 {      //右滑
            currentIndex = (images.count + (currentIndex - 1)) % images.count
            pageControl.currentPage = (images.count + pageControl.currentPage - 1) % images.count
        } else if offset.x == SCREEN_WIDTH * 2 {
            currentIndex = (currentIndex + 1) % images.count
            pageControl.currentPage = (pageControl.currentPage + 1) % images.count
        } else {
            return
        }
        leftImageView.image = UIImage(named: images[(images.count + (currentIndex - 1)) % images.count] as! String)
        midImageView.image = UIImage(named: images[currentIndex % images.count] as! String)
        rightImageView.image = UIImage(named: images[(currentIndex + 1) % images.count] as! String)
        
        backScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    }
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.reloadImage(scrollView.contentOffset)
    }
}
