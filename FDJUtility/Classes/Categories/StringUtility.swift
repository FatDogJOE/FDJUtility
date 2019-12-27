//
//  StringUtility.swift
//  FDJUtility
//
//  Created by mac on 2019/7/25.
//

import Foundation
import CommonCrypto
import UIKit

public extension String {
    
    func md5String() -> String {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        
        CC_MD5(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_MD5_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate()
        
        return String(format: hash as String)
    }
    
    func md5Data() -> Data {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        
        CC_MD5(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let dataBuffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_MD5_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
        }
        
        return Data(buffer: dataBuffer)
    }
    
    func sha1String() -> String {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        
        CC_SHA1(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_SHA1_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate()
        
        return String(format: hash as String)
    }
    
    func sha1Data() -> Data {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        
        CC_SHA1(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let dataBuffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_MD5_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
        }
        
        return Data(buffer: dataBuffer)
        
    }
    
    func sha256String() -> String {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA256_DIGEST_LENGTH))
        
        CC_SHA256(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_SHA256_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate()
        
        return String(format: hash as String)
    }
    
    func sha256Data() -> Data {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA256_DIGEST_LENGTH))
        
        CC_SHA256(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let dataBuffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_MD5_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
        }
        
        return Data(buffer: dataBuffer)
    }
    
    func sha512String() -> String {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA512_DIGEST_LENGTH))
        
        CC_SHA512(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_SHA512_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate()
        
        return String(format: hash as String)
    }
    
    func sha512Data() -> Data {
        
        let cString = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA512_DIGEST_LENGTH))
        
        CC_SHA512(cString!, CUnsignedInt(self.lengthOfBytes(using: .utf8)), result)
        
        let dataBuffer = UnsafeBufferPointer<UInt8>.init(start: result, count: Int(CC_MD5_DIGEST_LENGTH))
        
        defer {
            result.deallocate()
        }
        
        return Data(buffer: dataBuffer)
    }
    
    func base64String() -> String? {
        let data = self.data(using: .utf8)
        return data?.base64EncodedString()
    }
    
    func base64Data() -> Data? {
        let data = self.data(using: .utf8)
        return data?.base64EncodedData()
    }
}

public extension String {
    
    func toAttribute(size:Float, hex:UInt32, alpha:Float = 1, weight:UIFont.Weight = .regular, lineSpacing:Float = 2) -> NSAttributedString {
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = CGFloat(lineSpacing)
        
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: CGFloat(size), weight: weight), NSAttributedString.Key.foregroundColor:UIColor.hex(hex: hex), NSAttributedString.Key.paragraphStyle:paragraph]
        return NSAttributedString(string: self, attributes: attributes)
    }
    
}

public extension NSAttributedString {
    
    convenience init(string:String, font:UIFont, color:UIColor) {
        self.init(string:string, attributes:[NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:color])
    }
    
}
