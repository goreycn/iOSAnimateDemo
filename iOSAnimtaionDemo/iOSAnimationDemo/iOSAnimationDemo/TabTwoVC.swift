//
//  TabTwoVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/14.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class TabTwoVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(colorLayer)
        view.addSubview(btnChange)
        
         view.backgroundColor = UIColor.blueColor()
        
        btnChange.frame = CGRect(x: 50, y:180, width: 100, height: 35)
    }
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.randomColor().CGColor
        a.contents = UIImage(named:"g.jpg")?.CGImage
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
        
    }
    
}