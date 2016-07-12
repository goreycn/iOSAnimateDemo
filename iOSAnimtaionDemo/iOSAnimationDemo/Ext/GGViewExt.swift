//
//  GGViewExt.swift
//  BasicSwiftDemo
//
//  Created by Gorey on 16/6/15.
//  Copyright © 2016年 All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    // MARK: 圆角处理
    func gg_roundCorner(radius:CGFloat = 5) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    // MARK: 边线颜色
    func gg_borderColor(color:UIColor?, _ width:CGFloat = 1.0){
        if let borderColor = color {
            self.layer.borderColor = borderColor.CGColor
        }
        self.layer.borderWidth = width
    }

    // MARK: - Frame 属性的快速操作
    var x:CGFloat  {
        get {
            return frame.origin.x
        }
    }
    var y:CGFloat  {
        get {
            return frame.origin.y
        }
    }
    var width:CGFloat  {
        get {
            return frame.size.width
        }
    }
    var height:CGFloat {
        get {
            return frame.size.height
        }
    }
    
    var cx: CGFloat {
        get {
            return center.x
        }
    }
    
    var cy: CGFloat {
        get {
            return center.y
        }
    }
    
    // MARK: - 右侧x值
    var rx: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
    }
    // MARK: - 底部Y值
    var by: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
    }
}
