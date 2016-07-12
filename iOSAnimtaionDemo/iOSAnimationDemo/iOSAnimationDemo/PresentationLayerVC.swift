//
//  PresentationLayerVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/12.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import QuartzCore

class PresentationLayer: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.layer.addSublayer(colorLayer)
        
        colorLayer.position = CGPoint(x: view.width/2, y: view.height/2)
    }
    
    
    lazy var colorLayer : CALayer = {
        let a = CALayer()
        a.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        a.backgroundColor = UIColor.randomColor().CGColor
        return a
    }()
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let point = touches.first?.locationInView(view)
        if let pt = point {
            
            if let _ = colorLayer.hitTest(pt) {
                self.colorLayer.backgroundColor = UIColor.randomColor().CGColor
            }
            else {
                
                // 这个例子证明: 当layer在过渡动画时, 看到的是 : self.colorLayer.presetionLayer*(
                CATransaction.begin()
                CATransaction.setAnimationDuration(4)
                
                self.colorLayer.position = pt
                
                CATransaction.commit()
            }
        }
    }
    
}