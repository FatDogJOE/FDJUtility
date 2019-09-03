//
//  NSDictionary+FDJUtility.m
//  FDJUtility
//
//  Created by mac on 2019/9/3.
//

#import "NSDictionary+FDJUtility.h"

@implementation NSDictionary (FDJUtility)

- (NSString * (^)(NSString * key))stringValue {
    return ^ NSString * (NSString * key) {
        
        id value = [self valueForKey:key];
        
        if ([value isKindOfClass:NSString.class]) {
            return value;
        }else if ([value isKindOfClass:NSNumber.class]) {
            return [NSString stringWithFormat:@"%@",value];
        }else {
            return @"";
        }
        
        return nil;
    };
}
- (BOOL(^)(NSString * key))boolValue {
    return ^BOOL(NSString * key) {
        
        id value = [self valueForKey:key];
        
        if ([value isKindOfClass:NSString.class]) {
            return ((NSString *)value).boolValue;
        } else if ([value isKindOfClass:NSNumber.class]) {
            return ((NSNumber *)value).boolValue;
        }else {
            return NO;
        }
        
    };
}
- (double(^)(NSString * key))doubleValue {
    return ^double(NSString * key) {
        id value = [self valueForKey:key];
        
        if ([value isKindOfClass:NSString.class]) {
            return ((NSString *)value).doubleValue;
        } else if ([value isKindOfClass:NSNumber.class]) {
            return ((NSNumber *)value).doubleValue;
        }else {
            return 0;
        }
    };
}
- (NSInteger(^)(NSString * key))integerValue {
    return ^NSInteger(NSString * key) {
        id value = [self valueForKey:key];
        
        if ([value isKindOfClass:NSString.class]) {
            return ((NSString *)value).integerValue;
        } else if ([value isKindOfClass:NSNumber.class]) {
            return ((NSNumber *)value).integerValue;
        }else {
            return 0;
        }
    };
}
- (NSDictionary * (^)(NSString * key))dicValue {
    return ^NSDictionary *(NSString * key) {
        id value = [self valueForKey:key];
        
        if ([value isKindOfClass:NSDictionary.class]) {
            return value;
        } else {
            return @{};
        }
        
    };
}
- (NSArray * (^)(NSString * key))arrayValue {
    return ^NSArray *(NSString * key) {
        id value = [self valueForKey:key];
        
        if ([value isKindOfClass:NSArray.class]) {
            return value;
        } else {
            return @[];
        }
        
    };
}

@end
