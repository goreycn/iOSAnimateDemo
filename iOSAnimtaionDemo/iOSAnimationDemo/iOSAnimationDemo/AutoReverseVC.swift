//
//  AutoReverseVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/16.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class AutoReverseVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(colorLayer)
        view.addSubview(btnChange)
        
        btnChange.frame = CGRect(x: 50, y:180, width: 100, height: 35)
        
        

        colorLayer.position = CGPoint(x: 200, y: 200)
        btnChange.center = CGPoint(x: 160, y: view.by - 100)
        
        
        // 把"门轴移到图像的左边上"
        colorLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
        // 精髓: 为了让子layer有透视效果
        var pers = CATransform3DIdentity
        pers.m34 = -1.0 / 500.0
        view.layer.sublayerTransform = pers
        
    }
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.randomColor().CGColor
        a.contents = UIImage(named: "g.jpg")?.CGImage
        a.frame = CGRect(x: 10, y: 10, width: 150, height: 150)
        
        return a
    }()
    
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("change")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    func onClickChange() -> Void {
        
        
        let anim = CABasicAnimation()
        anim.autoreverses = true
        anim.keyPath = "transform.rotation.y"
        anim.byValue = CGFloat(-M_PI_2)
        anim.duration = 1.0
        
        self.colorLayer.addAnimation(anim, forKey: nil)
    }
    
}