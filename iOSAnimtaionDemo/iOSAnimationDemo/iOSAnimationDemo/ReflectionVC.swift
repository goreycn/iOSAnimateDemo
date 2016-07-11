//
//  ReflectionVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/11.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import CoreMedia
import SnapKit

class ReflectionVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(vlayer)
    }
   
    
    // MARK: - 向下显示镜像效果
    lazy var vlayer : CAReplicatorLayer = {
        
        let layer = CAReplicatorLayer()
      
        layer.instanceCount = 2
        layer.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        layer.backgroundColor = UIColor.grayColor().CGColor
        // 设置反射后的效果
        
        var transform = CATransform3DIdentity
        
        transform = CATransform3DScale(transform, 1, -1, 0) // y 方向 反转

        layer.instanceTransform = transform
        
        // 减少alpha
        layer.instanceAlphaOffset = -0.6
        
        let sl = CALayer()
        sl.contents = UIImage(named: "g.jpg")?.CGImage
        sl.contentsGravity = kCAGravityResizeAspectFill
        sl.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        sl.masksToBounds = true
    
        layer.addSublayer(sl)
        return layer
    }()
}