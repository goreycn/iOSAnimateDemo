//
//  TransformAnimationVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/12.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class TransformAnimationVC: UIViewController {
    
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
        a.contents = UIImage(named: "g.jpg")?.CGImage
        a.contentsGravity = kCAGravityResizeAspectFill
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
        
        // 比起 直接使用 transform 来做keypath , 可以旋转多于360度的动画
        anim.keyPath = "transform.rotation"
        anim.duration = 2.0
        anim.byValue = CGFloat(M_PI * 2)
        
        self.colorLayer.addAnimation(anim, forKey: nil)
    }
    
}