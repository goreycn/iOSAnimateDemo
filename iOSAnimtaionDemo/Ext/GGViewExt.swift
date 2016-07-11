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
    
}
