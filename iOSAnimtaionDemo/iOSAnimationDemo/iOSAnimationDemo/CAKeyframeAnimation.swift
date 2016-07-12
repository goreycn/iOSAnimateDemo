//
//  CAKeyframeAnimation.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/12.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class CAKeyframeAnimationVC: UIViewController {
    
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
        a.frame = CGRect(x: 10, y: 10, width: 130, height: 130)
        
        return a
    }()
    
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("change")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    func onClickChange() -> Void {
        let anim = CAKeyframeAnimation()
        anim.keyPath = "backgroundColor"
        anim.duration = 2.0
        anim.values = [
            UIColor.blueColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor.greenColor().CGColor,
            UIColor.blueColor().CGColor
        ]
        self.colorLayer.addAnimation(anim, forKey: nil)
    }
    
}