//
//  ChangeColorVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/11.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import QuartzCore

class ChangeColorVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.addSubview(containerView)
        
        containerView.layer.addSublayer(colorLayer)
        
        view.addSubview(btnChange)
        btnChange.frame = CGRect(x: containerView.x + 20,
                                 y: containerView.by + 20,
                                 width: 120,
                                 height: 35)
    }
    
    lazy var containerView : UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.grayColor()
        a.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        return a
    }()
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.backgroundColor = UIColor.redColor().CGColor
        a.frame = CGRect(x: 10, y: 10, width: 180, height: 180)
        return a
    }()
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("ChangeColor")
        a.addTarget(self, action: #selector(onClickChangeColor), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    // MARK: - 点击事件
    func onClickChangeColor() -> Void {
        
        // 自带颜色过渡动画,  不会 瞬间变化, 也就是书上说的 隐式动画. 
        // 默认动画时间为 0.25 秒
//      colorLayer.backgroundColor = UIColor.randomColor().CGColor
        
        
        
        // 手动控制动画属性
        CATransaction.begin()
        
        CATransaction.setAnimationDuration(1) // 看看1秒的效果
        CATransaction.setCompletionBlock { // 完成块
            
            // 注意这里的 回调, 是一个新的动画, 所以速度上, 又回到了自动的 0.25 秒
            var trans = self.colorLayer.transform
            trans = CATransform3DRotate(trans, CGFloat(M_PI/3), 0, 0, 1)
            self.colorLayer.transform = trans
            
        }
        
        colorLayer.backgroundColor = UIColor.randomColor().CGColor
        
        CATransaction.commit()
        
    }
    
}


