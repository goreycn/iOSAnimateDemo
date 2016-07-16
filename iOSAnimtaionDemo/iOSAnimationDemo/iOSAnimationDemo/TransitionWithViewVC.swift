//
//  TransitionWithViewVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/15.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class TransitionWithViewVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        gg_defaultSetup()
        
        view.addSubview(imageView)
        view.addSubview(btnChange)
        
        btnChange.frame = CGRect(x: 50, y:180, width: 100, height: 35)
    }
    
    // MARK: - 要现显的图片
    let imageArray = [
        "1.jpg",
        "2.jpg",
        "3.jpg",
        "4.jpg"
    ]
    var idx = 0
    
    lazy var imageView : UIImageView = {
        
        let a = UIImageView()
        a.image = self.nextImage()
        a.contentMode = UIViewContentMode.ScaleAspectFill
        a.frame = CGRect(x: 10, y: 10, width: 130, height: 130)
        a.clipsToBounds = true
        return a
    }()
    
    
    lazy var btnChange : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("change")
        a.addTarget(self, action: #selector(onClickChange), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    func onClickChange() -> Void {
        
        /*
             参数:
         TransitionNone
         TransitionFlipFromLeft
         TransitionFlipFromRight
         TransitionCurlUp
         TransitionCurlDown
         TransitionCrossDissolve
         TransitionFlipFromTop
         TransitionFlipFromBottom
         
         */
        
        
        UIView.transitionWithView(self.imageView,
                                  duration: 1.0,
                                  options: UIViewAnimationOptions.TransitionFlipFromTop,
                                  animations:{
                self.imageView.image = self.nextImage()
            },
                                  completion: nil)
    }
    
    
    func nextImage() -> UIImage? {
        let currImage = UIImage(named: imageArray[idx % imageArray.count])
        idx = idx + 1
        return currImage
    }
    
}