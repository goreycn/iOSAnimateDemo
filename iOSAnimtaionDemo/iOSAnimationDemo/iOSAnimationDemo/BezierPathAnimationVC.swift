//
//  BezierPathAnimationVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/12.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class BezierPathAnimationVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.addSubview(btnChange)
        
        btnChange.frame = CGRect(x: 50, y:view.by - 100, width: 100, height: 35)
        

        
    }
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.contents = UIImage(named: "g.jpg")?.CGImage
        a.contentsGravity = kCAGravityResizeAspectFill
        a.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        a.position = CGPoint(x: 50, y: 150)
        return a
    }()
    
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("fly")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    
    // MARK: - 创建Bezier PATH , 再加上 keyframeAnimation 执行动画
    func onClickChange() -> Void {
        
        // 显示飞行物体
        self.view.layer.addSublayer(colorLayer)
        
        // 创建Bezier Path
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPoint(x:50, y:150))
        bezierPath.addCurveToPoint(CGPoint(x: 300, y:500),
                                   controlPoint1: CGPoint(x:300, y: 0),
                                   controlPoint2: CGPoint(x: 0, y: 500))
        
        // 创建Shape Layer
        let pathLayer = CAShapeLayer()
        pathLayer.path = bezierPath.CGPath
        pathLayer.fillColor = UIColor.clearColor().CGColor
        pathLayer.strokeColor = UIColor.redColor().CGColor
        pathLayer.lineWidth = 3.0
        
        
        // 显示动画路径
        self.view.layer.addSublayer(pathLayer)
        // 执行动画
        let anim = CAKeyframeAnimation()
        anim.keyPath = "position"
        anim.duration = 4.0
        anim.path = bezierPath.CGPath
        anim.rotationMode = kCAAnimationRotateAuto // 让飞行物体正方向, 沿着运行前进的正方向
        colorLayer.addAnimation(anim, forKey: nil)
        
    }
    
}












