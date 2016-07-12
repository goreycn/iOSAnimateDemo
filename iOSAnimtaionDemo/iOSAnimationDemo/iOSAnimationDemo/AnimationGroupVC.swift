//
//  AnimationGroupVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/12.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class AnimationGroupVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(colorLayer)
        view.addSubview(btnChange)
        
        btnChange.frame = CGRect(x: 50, y:180, width: 100, height: 35)
    }
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.randomColor().CGColor
        a.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        
        return a
    }()
    
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("change")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    func onClickChange() -> Void {
        // create path
        let bez = UIBezierPath()
        bez.moveToPoint(CGPoint(x: 160, y: 50))
        bez.addCurveToPoint(CGPoint(x:160, y: 300),
                            controlPoint1: CGPoint(x: 320, y: 0),
                            controlPoint2: CGPoint(x: 0, y:500))
        
        // create path layer
        let pathLayer = CAShapeLayer()
        pathLayer.path = bez.CGPath
        pathLayer.fillColor = UIColor.clearColor().CGColor
        pathLayer.strokeColor = UIColor.redColor().CGColor
        pathLayer.lineWidth = 5.0
        
        self.view.layer.addSublayer(pathLayer)
        
        
        // add fly layer
        self.view.layer.addSublayer(colorLayer)
        colorLayer.position = CGPoint(x: 160, y: 50)

        
        // animation one
        let pathAnim = CAKeyframeAnimation()
        pathAnim.path = bez.CGPath
        pathAnim.keyPath = "position"
        pathAnim.rotationMode = kCAAnimationRotateAuto
        
        // animation two
        let colorAnim = CABasicAnimation()
        colorAnim.keyPath = "backgroundColor"
        colorAnim.toValue = UIColor.randomColor().CGColor
        
        
        // animate group
        let groupAnim = CAAnimationGroup()
        groupAnim.animations = [pathAnim, colorAnim]
        groupAnim.duration = 4.0
        
        
        // run animation
        self.colorLayer.addAnimation(groupAnim, forKey: nil)
        
    }
    
}