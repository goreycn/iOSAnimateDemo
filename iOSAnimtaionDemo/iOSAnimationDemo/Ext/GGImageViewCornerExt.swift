//
//  GGImageViewCornerExt.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/10.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import CoreMedia

public extension UIImageView {
    // MARK: 指定UIImageView 任意4个角中的几个位置和半径, 可以切边显示
    //
    func gg_roundCorners(radius: CGFloat, corners: UIRectCorner) {
        
        // 创建带两个圆角的 PATH
        let rect = bounds
        let radii = CGSize(width: radius, height: radius)
        
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [UIRectCorner.BottomLeft, UIRectCorner.BottomRight, UIRectCorner.TopLeft],
                                cornerRadii: radii)
        
        // 创建 MASK
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.CGPath
        
        layer.mask = maskLayer
    }
}