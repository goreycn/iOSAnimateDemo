//
//  ReverseControlVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/16.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ReverseControlVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(colorLayer)
       
       
        colorLayer.position = CGPoint(x: 200, y: 200)
        
        
        // 把"门轴移到图像的左边上"
        colorLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
        // 精髓: 为了让子layer有透视效果
        var pers = CATransform3DIdentity
        pers.m34 = -1.0 / 500.0
        view.layer.sublayerTransform = pers
        
        
        // 把动画的速度设为0, 也就是 禁止动画直接播放
        colorLayer.speed = 0
        
        let anim = CABasicAnimation()
        anim.autoreverses = true
        anim.keyPath = "transform.rotation.y"
        anim.byValue = CGFloat(-M_PI_2)
        anim.duration = 1.0
        
        self.colorLayer.addAnimation(anim, forKey: nil)
        
        // 添加手动控制
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(pan)
    }
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.randomColor().CGColor
        a.contents = UIImage(named: "g.jpg")?.CGImage
        a.frame = CGRect(x: 10, y: 10, width: 150, height: 150)
        
        return a
    }()
    
    
    func onPan(pan:UIPanGestureRecognizer) -> Void {
        // pan 的水平位置
        var x = pan.translationInView(self.view).x
        print(x)
        x /= 200
        
        // 取得当前的动画时间轴位置
        var timeOffset = self.colorLayer.timeOffset
        // 换算出手势以后的动画时间点
        timeOffset = min(0.999, max(0.0, Double(timeOffset) - Double(x)))
        
        self.colorLayer.timeOffset = timeOffset
        
        // 把pan的逻辑位置清零 ??
        pan.setTranslation(CGPointZero, inView: self.view)
    }
    
}