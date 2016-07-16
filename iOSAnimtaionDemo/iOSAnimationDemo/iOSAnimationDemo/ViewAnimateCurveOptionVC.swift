//
//  ViewAnimateCurveOptionVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/16.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ViewAnimateCurveOptionVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.addSubview(colorView)

    }
    
    lazy var colorView : UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.randomColor()
        a.frame = CGRect(x: 10, y: 10, width: 130, height: 130)
        
        return a
    }()
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let pt = touch.locationInView(self.view)
            
            UIView.animateWithDuration(1.0,
                                       delay: 0,
                                       options: UIViewAnimationOptions.CurveEaseInOut,
                                       animations: { 
                                        self.colorView.center = pt
                }, completion: nil)
        }
    }
    
}