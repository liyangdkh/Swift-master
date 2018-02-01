//
//  ProgressView.swift
//  TestTable
//
//  Created by liyang on 16/8/3.
//  Copyright © 2016年 dashang. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    var trackLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    var _progress: Float!
    var _trackColor: UIColor!
    var _progressColor: UIColor!
    var _progressWidth: Float!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer = CAShapeLayer()
        trackLayer.frame = self.bounds
        trackLayer.fillColor = nil
        self.layer.addSublayer(trackLayer)
        progressLayer = CAShapeLayer()
        progressLayer.frame = self.bounds
        progressLayer.lineCap = kCALineCapRound
        progressLayer.fillColor = nil
        self.layer.addSublayer(progressLayer)
        
        self.progressWidth = 5.0
    }
    
    func setupTrackLayer() {
        let trackPath = UIBezierPath(arcCenter: CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2), radius: (self.bounds.size.width - CGFloat(self.progressWidth))/2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        self.trackLayer.path = trackPath.CGPath;
    }
    
    func setupProgressLayer() {
        let progressPath = UIBezierPath.init(arcCenter: CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2), radius: (self.bounds.size.width - CGFloat(self.progressWidth))/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2) * Double(self._progress) - M_PI_2), clockwise: true)
        self.progressLayer.path = progressPath.CGPath;
    }
    
    var progress: Float {
        set {
            _progress = newValue
            setupProgressLayer()
        }
        get {
            return _progress
        }
    }
    
    var trackColor: UIColor {
        set {
            _trackColor = newValue
            self.trackLayer.strokeColor = newValue.CGColor
        }
        get {
            return _trackColor
        }
    }
    
    var progressColor: UIColor {
        set {
            _progressColor = newValue
            self.progressLayer.strokeColor = newValue.CGColor
        }
        get {
            return _progressColor
        }
    }
    
    var progressWidth: Float {
        set {
            _progressWidth = newValue
            setupTrackLayer()
            self.trackLayer.lineWidth = CGFloat(newValue)
            self.progressLayer.lineWidth = CGFloat(newValue)
        }
        get {
            return _progressWidth
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
