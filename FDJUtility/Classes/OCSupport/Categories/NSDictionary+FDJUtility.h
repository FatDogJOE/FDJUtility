//
//  NSDictionary+FDJUtility.h
//  FDJUtility
//
//  Created by mac on 2019/9/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (FDJUtility)

- (NSString * (^)(NSString * key))stringValue;
- (BOOL(^)(NSString * key))boolValue;
- (double(^)(NSString * key))doubleValue;
- (NSInteger(^)(NSString * key))integerValue;
- (NSDictionary * (^)(NSString * key))dicValue;
- (NSArray * (^)(NSString * key))arrayValue;

@end

NS_ASSUME_NONNULL_END
