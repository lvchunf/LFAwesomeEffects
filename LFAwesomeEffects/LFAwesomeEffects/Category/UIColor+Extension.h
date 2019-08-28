//
//  UIColor+Extension.h
//  LFCategory
//
//  Created by chunf on 2019/7/22.
//  Copyright © 2019 chunf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

@interface UIColor (Extension)

+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;


@end

NS_ASSUME_NONNULL_END
