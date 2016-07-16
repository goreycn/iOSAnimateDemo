//
//  CAMediaTimingFunctionVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/16.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class CAMediaTimingFunctionVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(colorLayer)

    }
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.randomColor().CGColor
        a.frame = CGRect(x: 10, y: 10, width: 130, height: 130)
        
        return a
    }()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let pt = touch.locationInView(self.view)
            
            CATransaction.begin()
            CATransaction.setAnimationDuration(1.0)
            
            // 指定动画时间函数 (缓冲时间函数
            let fun = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            CATransaction.setAnimationTimingFunction(fun)
            
            self.colorLayer.position = pt
            
            CATransaction.commit()
        }
    }
    
}