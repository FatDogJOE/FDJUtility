//
//  ViewUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/7/25.
//

import Foundation

extension UIView {
    
    public var fdj_minX:CGFloat {
        return self.frame.minX
    }
    
    public var fdj_midX:CGFloat {
        return self.frame.midX
    }

    public var fdj_maxX:CGFloat {
        return self.frame.maxX
    }

    public var fdj_minY:CGFloat {
        return self.frame.minY
    }

    public var fdj_midY:CGFloat {
        return self.frame.midY
    }

    public var fdj_maxY:CGFloat {
        return self.frame.maxY
    }
    
    public func moveMinX(to:CGFloat) {
        var frame = self.frame
        frame.origin.x = to
        self.frame = frame
    }
    
    public func moveMidX(to:CGFloat) {
        var frame = self.frame
        frame.origin.x = to - frame.width / 2
        self.frame = frame
    }
    
    public func moveMaxX(to:CGFloat) {
        var frame = self.frame
        frame.origin.x = to - frame.width
        self.frame = frame
    }
    
    public func moveMinY(to:CGFloat) {
        var frame = self.frame
        frame.origin.y = to
        self.frame = frame
    }
    
    public func moveMidY(to:CGFloat) {
        var frame = self.frame
        frame.origin.y = to - frame.height / 2
        self.frame = frame
    }
    
    public func moveMaxY(to:CGFloat) {
        var frame = self.frame
        frame.origin.y = to - frame.height
        self.frame = frame
    }
    
}
