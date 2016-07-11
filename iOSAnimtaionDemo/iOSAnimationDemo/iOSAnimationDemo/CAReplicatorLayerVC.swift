//
//  CAReplicatorLayerVC.swift
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

class CAReplicatorLayerVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gg_defaultSetup()
        
        view.addSubview(contrainerView)
        contrainerView.frame = view.bounds
        
        let replicator = CAReplicatorLayer()
        replicator.frame = contrainerView.bounds
        
        contrainerView.layer.addSublayer(replicator)
        
        // 开始配置, 配置10个实例
        replicator.instanceCount = 10
        
        // 对每一个实例增加 transform
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, -20, 50, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI/10.0), 0, 0, 1)
        replicator.instanceTransform = transform
        
        // 颜色偏移: 慢慢显示成红色
        replicator.instanceBlueOffset = -0.1
        replicator.instanceGreenOffset = -0.1
        
        // 创建每一个实例, 然后系统会自动复制
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        layer.backgroundColor = UIColor.whiteColor().CGColor
        replicator.addSublayer(layer)
       
    }
    
    lazy var contrainerView : UIView = {
        let a = UIView()
        return a
    }()
    
}