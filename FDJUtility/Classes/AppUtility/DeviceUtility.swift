//
//  DeviceUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/7/25.
//

import Foundation
import SAMKeychain

public enum DeviceModel:Int {
    case iPhone
    case iPad
    case iPodTouch
    case unKnown
    
    func desc() -> String {
        switch self {
        case .iPhone:
            return "iPhone"
        case .iPad:
            return "iPad"
        case .iPodTouch:
            return "iPod touch"
        case .unKnown:
            return "unknown"
        }
    }
}

public class DeviceUtility : NSObject {
    
    public static func systemVersion() -> String {
        let version = UIDevice.current.systemName
        return version
    }
    
    public static func deviceUUID() -> String {
        let uuid = SAMKeychain.password(forService: "DeviceUtility", account: "GetUUID") ?? ""
        
        if uuid.count > 0 {
            return uuid
        }else {
            let newId = UIDevice.current.identifierForVendor?.uuidString
            
            SAMKeychain.setPassword(newId!, forService: "DeviceUtility", account: "GetUUID")
            
            return newId!
        }
    }
    
    public static func bangDevice() -> Bool {
        
        if #available(iOS 11.0, *) {
            
            if let delegate = UIApplication.shared.delegate, let window = delegate.window {
                if window!.safeAreaInsets.bottom > 0.0 {
                    return true
                }else {
                    return false
                }
            }else {
                return false
            }
            
        }else {
            return false
        }
    
    }
    
    public static func navigationBarHeight() -> CGFloat {
        return UIApplication.shared.statusBarFrame.size.height + 44
    }
    
    
    public static func deviceType() -> DeviceModel {
        
        let deviceTypeString = UIDevice.current.model
        
        if  deviceTypeString == "iPhone" {
            return .iPhone
        } else if deviceTypeString == "iPad" {
            return .iPad
        } else if deviceTypeString == "iPod touch" {
            return .iPodTouch
        } else {
            return .unKnown
        }
    }
    
    
}
