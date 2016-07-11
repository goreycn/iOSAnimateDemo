//
//  AVPlayerLayerVC.swift
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
import AVFoundation

class AVPlayerLayerVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gg_defaultSetup()
                
        view.layer.addSublayer(layer)
        layer.contentsGravity = kCAGravityResizeAspectFill
       
        
        view.addSubview(btnStart)
        view.addSubview(btnPause)
        
        btnStart.snp_makeConstraints{
            m in
            m.l.e(view)
            m.b.e(view, -60)
            m.h.e(30)
            m.w.e(80)
        }
        
        btnPause.snp_makeConstraints{
            m in
            m.l.e(btnStart.r, 20)
            m.cy.e(btnStart)
            m.h.e(btnStart)
            m.w.e(btnStart)
        }
    }
    
    // MARK: - Player
    lazy var player:AVPlayer = {
        let path = NSBundle.mainBundle().pathForResource("mj", ofType: "mp4")!
        let a = AVPlayer(URL: NSURL(fileURLWithPath: path))
        
        return a
    }()
    
    // MARK: - 显示图层
    lazy var layer : AVPlayerLayer = {
        let a = AVPlayerLayer(player: self.player)
        a.frame = CGRect(x: 50, y: 50, width:300, height: 250)
        
        // 角度变化
        var trans = CATransform3DIdentity
        trans.m34 = -1.0/500.0
        trans = CATransform3DRotate(trans, CGFloat(M_PI_4), 1, 1, 0)
        a.transform = trans
        
        // 边线
        a.masksToBounds = true
        a.cornerRadius = 20.0
        a.borderWidth = 5.0
        a.borderColor = UIColor.redColor().CGColor

        return a
    }()
    
    
    // MARK: - 开始
    lazy var btnStart : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("start")
        a.addTarget(self, action: #selector(onStart), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()
    
    // MARK: - 暂停
    lazy var btnPause : UIButton = {
        let a = UIButton(type: UIButtonType.RoundedRect)
        a.gg_setTitle("pause")
        a.addTarget(self, action: #selector(onStop), forControlEvents: UIControlEvents.TouchUpInside)
        return a
    }()

    
    // MARK: - Button Click Event
    func onStart() -> Void {
        player.play()
    }
    
    func onStop() -> Void {
        player.pause()
    }
    
}