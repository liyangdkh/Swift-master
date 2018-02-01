//
//  ProgressViewController.swift
//  TestTable
//
//  Created by liyang on 16/8/3.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class ProgressViewController: BaseViewController {

    var progressView: ProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Progress View"
        progressView = ProgressView(frame: CGRectMake(100, 100, 200, 200))
        progressView.trackColor = UIColor.greenColor()
        progressView.progressColor = UIColor.redColor()
        progressView.progressWidth = 10.0
        self.view.addSubview(progressView)
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(timerSEL(_:)), userInfo: nil, repeats: true)
    }
    
    func timerSEL(timer: NSTimer) {
        struct strStruct {
            static var i = 0.0
        }
        strStruct.i += 0.1
        self.progressView.progress = Float(strStruct.i)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
