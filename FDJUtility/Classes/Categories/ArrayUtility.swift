//
//  ArrayUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/8/2.
//

import Foundation

public extension Array {
    
    func sameElementsIndexes(target:Array,primaryKey:(Element)->(String)) -> [Int]? {
        
        var orgDic:[String:(Int,Element)] = [:]
        
        for (index, element) in self.enumerated() {
            let key = primaryKey(element)
            orgDic[key] = (index,element)
        }
        
        var result : [Int] = []
        for element in target {
            let key = primaryKey(element)
            if let value = orgDic[key] {
                result.append(value.0)
            }
        }
        
        return result
    }
    
}
