//
//  GGButtonExt.swift
//  BasicSwiftDemo
//
//  Created by Gorey on 16/6/15.
//  Copyright © 2016年  All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    func gg_setTitle(title:String?) {
        if let t = title {
            setTitle(t, forState: [])
        }
    }    
}
