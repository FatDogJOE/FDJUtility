//
//  UIColor+FDJUtility.m
//  FDJUtility
//
//  Created by mac on 2019/9/10.
//

#import "UIColor+FDJUtility.h"

@implementation UIColor (FDJUtility)

+ (instancetype)colorWithHex:(UInt32)hex {
    return [UIColor colorWithHex:hex alpha:1];
}

+ (instancetype)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha {
    
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8)  & 0xFF;
    int b = (hex)       & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
}

- (UIImage *)getImage {
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self setFill];
    
    CGContextFillRect(context, rect);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
