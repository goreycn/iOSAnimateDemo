//
//  GGSnapKitExt.swift
//  BasicSwiftDemo
//
//  Created by Gorey on 16/6/15.
//  Copyright © 2016年  All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public extension UIView {
    /// left edge
    public var l: ConstraintItem { return self.snp_left }
    
    /// top edge
    public var t: ConstraintItem { return self.snp_top }
    
    /// right edge
    public var r: ConstraintItem { return self.snp_right }
    
    /// bottom edge
    public var b: ConstraintItem { return self.snp_bottom }
}


public extension ConstraintMaker {
    /// left edge
    public var l: ConstraintDescriptionExtendable {return self.left}
    
    /// top edge
    public var t: ConstraintDescriptionExtendable { return self.top}
    
    /// right edge
    public var r: ConstraintDescriptionExtendable { return self.right}
    
    /// bottom edge
    public var b: ConstraintDescriptionExtendable { return self.bottom}
    
    /// width dimension
    public var w: ConstraintDescriptionExtendable { return self.width}
    
    /// height dimension
    public var h: ConstraintDescriptionExtendable { return self.height}
    
    /// centerX dimension
    public var cx: ConstraintDescriptionExtendable { return self.centerX}
    
    /// centerY dimension
    public var cy: ConstraintDescriptionExtendable { return self.centerY}
}


public extension ConstraintDescriptionExtendable {
    
    func e(_ other: ConstraintItem, _ offset:CGFloat = 0) -> ConstraintDescriptionEditable {
        return equalTo(other).offset(offset)
    }
    
    func e(_ other: View, _ offset:CGFloat = 0) -> ConstraintDescriptionEditable {
        return equalTo(other).offset(offset)
    }
    
    func le(_ other: ConstraintItem, _ offset:CGFloat = 0) -> ConstraintDescriptionEditable {
        return lessThanOrEqualTo(other).offset(offset)
    }
    
    func le(_ other: View, _ offset:CGFloat = 0) -> ConstraintDescriptionEditable {
        return lessThanOrEqualTo(other).offset(offset)
    }
    
    func ge(_ other: ConstraintItem, _ offset:CGFloat = 0) -> ConstraintDescriptionEditable {
        return greaterThanOrEqualTo(other).offset(offset)
    }
    
    func ge(_ other: View, _ offset:CGFloat = 0) -> ConstraintDescriptionEditable {
        return greaterThanOrEqualTo(other).offset(offset)
    }
    
    func e(_ other: Int) -> ConstraintDescriptionEditable {
        return equalTo(other)
    }
    
    func e(_ other: Float) -> ConstraintDescriptionEditable {
        return equalTo(other)
    }
}
