//
//  DictionaryUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/9/3.
//

import Foundation

public extension Dictionary where Key==String, Value==Any  {
    
    func string(for key:String) -> String? {
        
        if let stringValue = self[key] as? String {
            return stringValue
        }else {
            return nil
        }
       
    }
    
    func integer(for key:String) -> Int? {
        
        if let intValue = self[key] as? Int {
            return intValue
        }else {
            return nil
        }
    
    }
    
    func double(for key:String) -> Double? {
        
        if let doubleValue = self[key] as? Double {
            return doubleValue
        }else {
            return nil
        }
        
    }
    
    func bool(for key:String) -> Bool? {
        
        if let boolValue = self[key] as? Bool {
            return boolValue
        }else {
            return nil
        }
        
    }
    
    func dic(for key:String) -> [String:Any]? {
        
        if let dicValue = self[key] as? [String:Any] {
            return dicValue
        }else {
            return nil
        }
        
    }
    
    func array(for key:String) -> [[String:Any]]? {
        
        if let arrayValue = self[key] as? [[String:Any]] {
            return arrayValue
        }else {
            return nil
        }
    }
    
}
