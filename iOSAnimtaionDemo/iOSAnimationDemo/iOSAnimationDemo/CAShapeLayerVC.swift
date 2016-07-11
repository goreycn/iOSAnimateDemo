//
//  CAShapeLayerVC.swift
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

class CAShapeLayerVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        gg_defaultSetup()

        view.addSubview(v)
        v.snp_makeConstraints {
            m in
            m.center.e(view)
            m.w.e(200)
            m.h.e(200)
        }

        // MARK: 指定 PATH
        let path = UIBezierPath()
        path.moveToPoint( CGPoint( x: 175, y: 100 ) )

        path.addArcWithCenter( CGPoint( x: 150, y: 100 ), radius: 25, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise:true)

        path.moveToPoint( CGPoint( x: 150, y: 125 ) )
        path.addLineToPoint( CGPoint( x: 150, y: 175 ) )
        path.addLineToPoint( CGPoint( x: 125, y: 225 ) )

        path.moveToPoint( CGPoint( x: 150, y: 175 ) )
        path.addLineToPoint( CGPoint( x: 175, y: 225 ) )
        
        path.moveToPoint( CGPoint( x: 100, y: 150 ) )
        path.addLineToPoint( CGPoint( x: 200, y: 150 ) )

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound

        shapeLayer.path = path.CGPath

        v.layer.addSublayer(shapeLayer)
    }

    // MARK: 画图layer 的容器
    lazy var v : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.lightGrayColor()
        return v
    }()

}