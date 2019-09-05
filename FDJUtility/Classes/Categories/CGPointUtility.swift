//
//  CGPointUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/9/5.
//

import Foundation

public extension CGPoint {
    
    static func +(lhs:CGPoint, rhs:CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func -(lhs:CGPoint, rhs:CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y);
    }
    
    static func *(lhs:CGPoint, rhs:CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
}
