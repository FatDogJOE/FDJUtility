//
//  APPUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/7/25.
//

import Foundation

public typealias SyncOnceClosure = ()->Bool
public typealias AsyncOnceClosure = ((Bool)->Void)->Void

public class APPUtility : NSObject {
    
    static var excutingDic : [String : Bool] = [:]
    
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
    
    @objc public static func syncOnce(key:String, queue:DispatchQueue = DispatchQueue.main, excute:@escaping SyncOnceClosure) -> Bool {
        
        let excuting = excutingDic[key] ?? false
        let performd = UserDefaults.standard.bool(forKey: key)
        
        if !performd && !excuting {
            
            objc_sync_enter(excutingDic)
            excutingDic[key] = true
            objc_sync_exit(excutingDic)
            
            queue.async {
                
                let result = excute()
                UserDefaults.standard.set(result, forKey: key)
                
                objc_sync_enter(excutingDic)
                excutingDic[key] = false
                objc_sync_exit(excutingDic)
                
            }
            return true
        }else {
            return false
        }
        
    }
    
    @objc public static func asyncOnce(key:String, queue:DispatchQueue = DispatchQueue.main, excute:@escaping AsyncOnceClosure) -> Bool {
        
        let excuting = excutingDic[key] ?? false
        let performd = UserDefaults.standard.bool(forKey: key)
        
        if (!performd && !excuting) {
            let completion : (Bool)->Void = { (finished) in
                
                objc_sync_enter(excutingDic)
                excutingDic[key] = false
                objc_sync_exit(excutingDic)
                
                UserDefaults.standard.set(finished, forKey: key)
            }
            
            queue.async {
                
                objc_sync_enter(excutingDic)
                excutingDic[key] = true
                excute(completion)
                objc_sync_exit(excutingDic)
                
            }
            
            return true
            
        }else {
            
            return false
            
        }
        
    }

}
