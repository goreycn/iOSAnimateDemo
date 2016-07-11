//
//  RoundCornerMaskVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/10.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import CoreMedia
import SnapKit

class RoundCornerMaskVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
         gg_defaultSetup()
        
        
        view.layer.addSublayer(imageLayer)
        imageLayer.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        
        // 创建带两个圆角的 PATH
        let rect = imageLayer.bounds
        let radii = CGSize(width: 30, height: 30)
    
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [UIRectCorner.BottomRight, UIRectCorner.TopLeft],
                                cornerRadii: radii)
        
        // 创建 MASK
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.CGPath

        imageLayer.mask = maskLayer
        
        
        
        // 测试一下扩展的可选性
        view.addSubview(imageView)
        imageView.snp_makeConstraints{
            m in
            m.l.e(view, 50)
            m.t.e(view, 400)
            m.w.e(200)
            m.h.e(200)
        }
        
        imageView.gg_roundCorners(80, corners: [UIRectCorner.BottomLeft, UIRectCorner.BottomRight, UIRectCorner.TopLeft])
    }
    
    
    lazy var imageLayer:CALayer = {
        let a = CALayer()
        a.contents = UIImage(named:"g.jpg")?.CGImage
        a.masksToBounds = true
        a.contentsGravity = kCAGravityResizeAspectFill
        return a
    }()
    
    
    lazy var imageView:UIImageView = {
        let a = UIImageView(image: UIImage(named: "g.jpg"))
        a.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        a.contentMode = UIViewContentMode.ScaleAspectFill
        a.clipsToBounds = true
        return a
    }()
    
}

