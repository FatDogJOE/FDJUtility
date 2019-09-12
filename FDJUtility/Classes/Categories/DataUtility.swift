//
//  DataUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/9/9.
//

import Foundation
import CommonCrypto

public extension Data {
    
    func md5String()->String {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        
        var source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_MD5(source, CC_LONG(self.count), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_MD5_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return String(format: hash as String)
        
    }
    
    func md5Data()->Data {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        
        let source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_MD5(source, CC_LONG(self.count), result)
        
        let buffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_MD5_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return Data(buffer: buffer)
    }
    
    func sha1String()->String {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        
        var source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_SHA1(source, CC_LONG(self.count), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_SHA1_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return String(format: hash as String)
    }
    
    func sha1Data()->Data {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        
        let source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_MD5(source, CC_LONG(self.count), result)
        
        let buffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_SHA1_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return Data(buffer: buffer)
        
    }
    
    func sha256String()->String {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA256_DIGEST_LENGTH))
        
        var source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_SHA256(source, CC_LONG(self.count), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_SHA256_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return String(format: hash as String)
    }
    
    func sha256Data()->Data {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA256_DIGEST_LENGTH))
        
        let source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_MD5(source, CC_LONG(self.count), result)
        
        let buffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_SHA256_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return Data(buffer: buffer)
        
    }
    
    func sha512String()->String {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA512_DIGEST_LENGTH))
        
        var source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_SHA512(source, CC_LONG(self.count), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_SHA512_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return String(format: hash as String)
    }
    
    func sha512Data()->Data {
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA512_DIGEST_LENGTH))
        
        let source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        CC_MD5(source, CC_LONG(self.count), result)
        
        let buffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_SHA512_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
            source.deallocate()
        }
        
        return Data(buffer: buffer)
        
    }
    
    
}

public extension Data {
    
    func getBytes() -> [UInt8] {
        
        var result : [UInt8] = []
        
        var source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        for i in 0 ..< self.count {
            result.append(source[i])
        }
        
        defer {
            source.deallocate()
        }
        
        return result
        
    }
    
    func getHex() -> String {
        
        var result : String = ""
        
        var source = UnsafeMutablePointer<UInt8>.allocate(capacity: self.count)
        
        self.copyBytes(to: source, count: self.count)
        
        for i in 0 ..< self.count {
            result.append(String(format: "%02X", source[i]))
        }
        
        defer {
            source.deallocate()
        }
        
        return result
        
    }
    
}
