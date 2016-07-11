//
//  File.swift
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

class CATextLayerVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

         gg_defaultSetup()
        
        view.addSubview(labelView)
        
        
        let textLayer =  CATextLayer()
        textLayer.frame = labelView.bounds
        
        labelView.layer.addSublayer(textLayer)
        
        
        // 设置属性
        textLayer.foregroundColor = UIColor.redColor().CGColor
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.wrapped = true
        
        
        // 选择字体
        let font = UIFont.systemFontOfSize(15)
        
        textLayer.font = font
        textLayer.fontSize = font.pointSize
        textLayer.contentsScale = UIScreen.mainScreen().scale // 不加这行的话, 字体显示发虚. retina 对应
        
        textLayer.string = "According to this, Injekt is giving its way to Kodein in preference to having only one library doing the same registry based DI.\r Injekt people don't seem to recommend use of Injekt for new projects, so it may be good to remove Injekt from the list to avoid any future confusion."
    }


    lazy var labelView : UIView = {
        let a = UIView()
        a.frame = CGRect(x: 10, y: 100, width: 300, height: 200)
        return a
    } ()


}