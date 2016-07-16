//
//  FadeAnimationVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/14.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class FadeAnimationVC: UIViewController {
    
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
        // 原本是针对 UIImageView 执行替换, 但是 在它的layer上加上 CATransition 动画, 一样有效
        let trans = CATransition()
        trans.type = kCATransitionFade //
        trans.subtype = kCATransitionFromTop  // Fade 时, 此参数无效
        
        /*
         CATransition type:类型
            kCATransitionFade
            kCATransitionMoveIn
            kCATransitionPush
            kCATransitionReveal
         
         CATransition subType
            kCATransitionFromTop
            kCATransitionFromLeft
            kCATransitionFromRight
            kCATransitionFromBottom
        */
        
        self.imageView.layer.addAnimation(trans, forKey: nil)
        
        self.imageView.image = self.nextImage()
    }
    
    
    func nextImage() -> UIImage? {
        let currImage = UIImage(named: imageArray[idx % imageArray.count])
        idx = idx + 1
        return currImage
    }
    
}