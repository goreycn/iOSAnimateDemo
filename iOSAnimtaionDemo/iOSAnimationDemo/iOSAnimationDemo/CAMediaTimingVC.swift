//
//  CAMediaTimingVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/16.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation

import UIKit
import QuartzCore

class CAMediaTimingVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(colorLayer)
        view.addSubview(btnChange)
        
        colorLayer.position = CGPoint(x: 160, y: 100)
        
        
        btnChange.frame = CGRect(x: 50, y:180, width: 100, height: 35)
        btnChange.center = CGPoint(x: 160, y: view.by - 100)
    }
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.randomColor().CGColor
        a.contents = UIImage(named:"g.jpg")?.CGImage
        a.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        
        return a
    }()
    
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("change")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    func onClickChange() -> Void {
        
        let duration = CFTimeInterval(1.0)
        let repeatCount = Float(2.5)
        
        let anim = CABasicAnimation()
        anim.keyPath = "transform.rotation"
        anim.duration = duration
        anim.repeatCount = repeatCount
        anim.byValue = CGFloat(M_PI * 2)
        
        self.colorLayer.addAnimation(anim, forKey: nil)
    }
    
}