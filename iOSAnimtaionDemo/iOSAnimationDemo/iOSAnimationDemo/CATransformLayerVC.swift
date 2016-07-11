//
//  CATransformLayerVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/11.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import CoreMedia
import SnapKit

class CATransformLayerVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
         gg_defaultSetup()
        
        view.addSubview(containerView)
        
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0 / 500.0
        
        containerView.layer.sublayerTransform = pt
        
       
        // setup transform for cube 1 and  add it
        var ct1 = CATransform3DIdentity
        ct1 = CATransform3DTranslate(ct1, -100, 0, 0)
        
        let cube1 = cubeWithTransform(ct1)
        containerView.layer.addSublayer(cube1)
        
        
        
        // 添加第2个cube
        var ct2 = CATransform3DIdentity
        ct2 = CATransform3DTranslate(ct2, 100, 0, 0)
        ct2 = CATransform3DRotate(ct2, CGFloat(-M_PI_4), 1, 0, 0)
        ct2 = CATransform3DRotate(ct2, CGFloat(-M_PI_4), 0, 1, 0)
        containerView.layer.addSublayer(cubeWithTransform(ct2))
        
    }
    
    
    // MARK: - 返回一个带随机颜色的 layer
    func faceWithTransorm(transform:CATransform3D) -> CALayer {
        
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        
        let red:CGFloat = CGFloat((arc4random() % 100)) / 100
        let green:CGFloat = CGFloat((arc4random() % 100)) / 100
        let blue:CGFloat = CGFloat((arc4random() % 100)) / 100
        
        face.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1).CGColor
        
        face.transform = transform
        
        return face
    }
    
    
    // MARK: - 返回一个立方体
    func cubeWithTransform(transform:CATransform3D) -> CALayer {
        let cube = CATransformLayer()
        
        // add face 1
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(faceWithTransorm(ct))
        
        
        // add face 2
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2), 0, 1, 0)
        cube.addSublayer(faceWithTransorm(ct))
        
        // add face 3
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2), 1, 0, 0)
        cube.addSublayer(faceWithTransorm(ct))
     
        // add face 4
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 1, 0, 0)
        cube.addSublayer(faceWithTransorm(ct))
        
        // add face 5
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 0, 1, 0)
        cube.addSublayer(faceWithTransorm(ct))
        
        // add face 6
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, CGFloat(M_PI), 0, 1, 0)
        cube.addSublayer(faceWithTransorm(ct))
        
        
        // center the cube layer within the container
        let containerSize = containerView.bounds.size
        cube.position = CGPoint(x: containerSize.width/2, y: containerSize.height/2)
        
        cube.transform = transform
        
        cube.contentsScale = UIScreen.mainScreen().scale
        
        return cube
    }
    
    
    // MARK: -  Container View
    lazy var containerView: UIView = {
        let v = UIView()
        v.layer.backgroundColor = UIColor.grayColor().CGColor
        v.frame = CGRect(x: 80, y: 100, width: 200, height: 200)
        return v
    }()
    
}