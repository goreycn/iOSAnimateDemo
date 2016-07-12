//
//  TransactionPushVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/12.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import QuartzCore

class TransactionPushVC: UIViewController {
    
    override func viewDidLoad() {
        gg_defaultSetup()
        
        view.addSubview(layerView)
        view.addSubview(btnChange)
        
        btnChange.frame = CGRect(x: 50, y: layerView.by + 30, width: 100, height: 35)
        
        layerView.layer.addSublayer(colorLayer)
    }
    
    lazy var layerView : UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.grayColor()
        a.frame = CGRect(x: 150, y: 10, width: 150, height: 150)
        return a
    }()
    
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.randomColor().CGColor
        a.frame = CGRect(x: 10, y: 10, width: 130, height: 130)
        
        // 添加自定义的 action
        let transition =  CATransition() // 是 CAAction 的子类
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        a.actions = ["backgroundColor":transition]
        
        return a
    }()
    
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("change")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    func onClickChange() -> Void {
        self.colorLayer.backgroundColor = UIColor.randomColor().CGColor

    }
    
    
}
