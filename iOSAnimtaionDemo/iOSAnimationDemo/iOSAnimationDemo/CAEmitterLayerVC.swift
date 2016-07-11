//
//  CAScrollLayerVC.swift
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

class CAEmitterLayerVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.addSubview(containerView)

        
        // 火焰
        let emitter = CAEmitterLayer()
        emitter.frame = self.containerView.bounds
        
        containerView.layer.addSublayer(emitter)
        
        
        // 配置
        emitter.renderMode = kCAEmitterLayerAdditive
        emitter.emitterPosition = CGPoint(x: emitter.frame.size.width / 2,
                                          y: emitter.frame.size.height / 2)
        
        // 创建一个 粒子模板
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "gs.jpg")?.CGImage
        cell.birthRate = 150
        cell.lifetime = 5.0
        // 这个颜色可以附加到小图片上去
        cell.color = UIColor(red: 1, green: 0.5, blue: 0.1, alpha: 1).CGColor
        cell.alphaSpeed = -0.4
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionRange = CGFloat(M_PI) * 2.0
        
        // 绑定
        emitter.emitterCells = [cell]
    }
    
    
    lazy var containerView : UIView = {
        let a = UIView()
        a.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        a.backgroundColor = UIColor.grayColor()
        return a
    }()
    
    
    
}