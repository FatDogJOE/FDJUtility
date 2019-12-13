//
//  DateUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/9/9.
//

import Foundation

public extension Date {
    
    func stringValue(format:String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
}

