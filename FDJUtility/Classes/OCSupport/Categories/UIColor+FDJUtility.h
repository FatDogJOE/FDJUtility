//
//  UIColor+FDJUtility.h
//  FDJUtility
//
//  Created by mac on 2019/9/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FDJUtility)

+ (instancetype)colorWithHex:(UInt32)hex;
+ (instancetype)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;

- (UIImage *)getImage;

@end

NS_ASSUME_NONNULL_END
