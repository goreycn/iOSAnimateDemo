//
//  ViewLayerActionVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/11.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import QuartzCore

class ViewLayerActionVC: UIViewController {
    
    override func viewDidLoad() {
        gg_defaultSetup()
        
        view.addSubview(layerView)
        view.addSubview(btnChange)
        
        btnChange.frame = CGRect(x: 50, y: layerView.by + 30, width: 100, height: 35)
        
        
        // 下面是测试action
        print("Outside animation block : \(self.layerView.actionForLayer(self.layerView.layer, forKey: "backgroundColor"))")
        
        
        UIView.beginAnimations(nil, context: nil)
        print("Inside animation block : \(self.layerView.actionForLayer(self.layerView.layer, forKey: "backgroundColor"))")
        UIView.commitAnimations()
    }
    
    lazy var layerView : UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.grayColor()
        a.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
        return a
    }()
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("change")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    func onClickChange() -> Void {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        
        // 此时是瞬时动画,  因为这个layer  是UIView控制的
        // UIView 把layer的关联属性都关掉了, CoreAnimation 就不起作用了
        self.layerView.layer.backgroundColor = UIColor.randomColor().CGColor
        
        CATransaction.commit()
        
        
        
        
        
        // 要使上面执行动画的话, 必须放在 UIView的animation 块里
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(1)
//        
//        self.layerView.layer.backgroundColor = UIColor.randomColor().CGColor
//        
//        UIView.commitAnimations()
        
        
    }
    
}