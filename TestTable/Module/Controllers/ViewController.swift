//
//  ViewController.swift
//  TestTable
//
//  Created by liyang on 16/5/6.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, TestButtonDelegate {
    
    var tableView: UITableView!    //define tableView property
    var datas: NSMutableArray!     //define tableView datas
    var testDataSource: TestTableDataSource!    //define tableView dataSource
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift"
        self.automaticallyAdjustsScrollViewInsets = false
        self.setupData()
        self.setupTable()
    }
    
    func setupData() {
        datas = [["title":"Banner","des":"A banner test written in swift"],
                 ["title":"TableView+SDWebImage","des":"A tableView with sdwebimage demo written in swift"],
                 ["title":"Address Selection demo","des":"An address selection demo written in swift"],
                 ["title":"Custom Collection View","des":"custom collection view demo written in swift"],
                 ["title":"Custom Alert, Actionsheet","des":"custom alert and actionsheet demo written in swift"],
                 ["title":"Net Request","des":"request url"],
                 ["title":"ProgressView","des":"progress"]]
    }
    
    func setupTable() {
        testDataSource = TestTableDataSource()
        testDataSource.testDatas = datas.mutableCopy() as! NSMutableArray
        testDataSource.delegate = self
        testDataSource.configureBtnClosure { (selectIndex) in
            print("Block test button touched at \(selectIndex)")
        }
         
        tableView = UITableView(frame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) , style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = testDataSource!
        tableView.rowHeight = 70.0
        tableView.tableFooterView = UIView.init()
        tableView.registerClass(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.testCellId() as String)
        self.view.addSubview(tableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func uploadImage() {
//        let testImage = UIImage(named: "test.jpg")
//        let imageData = UIImageJPEGRepresentation(testImage!, 1.0)
//        let base64str = imageData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
//        let parameter = ["ImagesByte": base64str!] as NSDictionary
//        DataRequest.requestDataWithUrl(IMAGE_HOST,
//                                       parameter: parameter,
//                                       success: {[weak self] (respondData: NSDictionary) in
//                                            self?.outputLog(respondData)
//                                       }) { (error: NSError) in
//                                            print(error)
//                                       }
//    }
    
    func outputLog (outputData: AnyObject) {
        print(outputData)
    }
    
    func testDelegateBtnClickedAtIndex(index: NSInteger) {
        print("Delegate test button touched at \(index)")
//        self.uploadImage()
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0 {
            let bannerVC = BannerViewController()
            self.navigationController?.pushViewController(bannerVC, animated: true)
        } else if indexPath.row == 1 {
            let sdVC = SDImageTestViewController()
            self.navigationController?.pushViewController(sdVC, animated: true)
        } else if indexPath.row == 2 {
            let addressVC = AddressViewController()
            self.navigationController?.pushViewController(addressVC, animated: true)
        } else if indexPath.row == 3 {
            let collectionVC = CollectionTestViewController()
            self.navigationController?.pushViewController(collectionVC, animated: true)
        } else if indexPath.row == 4 {
            let customsVC = CustomControlsViewController()
            self.navigationController?.pushViewController(customsVC, animated: true)
        } else if indexPath.row == 5 {
            let requestVC = RequestViewController()
            self.navigationController?.pushViewController(requestVC, animated: true);
        } else if indexPath.row == 6 {
            let progressVC = ProgressViewController()
            self.navigationController?.pushViewController(progressVC, animated: true)
        }
    }
}

