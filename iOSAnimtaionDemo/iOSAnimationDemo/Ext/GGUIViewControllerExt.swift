//
//  GGUIViewControllerExt.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/11.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    // MARK: - 设置UIViewController 默认初始化信息
    func gg_defaultSetup() -> Void {
        
        navigationController?.navigationBar.translucent = false
        view.backgroundColor = UIColor.whiteColor()
        
        if let _ = navigationController {
            title = String(self.classForCoder)
        }
 
    }
}