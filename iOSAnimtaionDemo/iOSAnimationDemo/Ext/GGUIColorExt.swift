//
//  GGUIColorExt.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/11.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    // MARK: - 返回一个随机颜色
    class func randomColor() -> UIColor {
        
        let red:CGFloat = CGFloat((arc4random() % 100)) / 100
        let green:CGFloat = CGFloat((arc4random() % 100)) / 100
        let blue:CGFloat = CGFloat((arc4random() % 100)) / 100
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}