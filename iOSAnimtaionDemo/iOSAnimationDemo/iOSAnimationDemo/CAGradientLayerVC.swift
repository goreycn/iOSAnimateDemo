//
//  CAGradientLayerVC.swift
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

class CAGradientLayerVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gg_defaultSetup()
        
        
        view.layer.addSublayer(gradiengLayer)
        gradiengLayer.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
    }
    
    // MARK: - 生成渐变色的Layer
    lazy var gradiengLayer : CAGradientLayer = {
        
        let layer = CAGradientLayer()
        
        // 从左上角 向 右下角排列 颜色显示
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        
        // 设置显示的颜色类型, 可以多个
        layer.colors = [UIColor.greenColor().CGColor,
                        UIColor.blueColor().CGColor,
                        UIColor.redColor().CGColor]
        
        // 设置色带的显示宽度, 这样可以不用平均显示每个颜色分区带
        layer.locations = [0.0, 0.25, 0.5]
        
        return layer
    }()
}