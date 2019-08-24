//
//  APPUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/7/25.
//

import Foundation

public class APPUtility : NSObject {
    
    @objc public static func appVersion() -> String {
        let infoDic = Bundle.main.infoDictionary
        let appVersion = infoDic?["CFBundleShortVersionString"] as! String
        return appVersion
    }
    
    @objc public static func appDisplayName() -> String {
        let infoDic = Bundle.main.infoDictionary
        if let appDisplayName = infoDic?["CFBundleDisplayName"] as? String {
            return appDisplayName
        } else {
            if let bundleName = infoDic?["CFBundleName"] as? String {
                return bundleName
            }
        }
        
        return ""
    }
    
    @objc public static func performOnce(key:String, async:Bool, handler:@escaping (()->(Bool))) {
        
        let block : (()->(Void)) = {
            if !UserDefaults.standard.bool(forKey: key) {
                let result = handler()
                UserDefaults.standard.set(result, forKey: key)
            }
        }
        
        if async {
            DispatchQueue.global().async(execute: block)
        } else {
            DispatchQueue.main.async(execute: block)
        }
        
    }

}
