//
//  AlipayHomeNavigationLeftView.m
//  LFAwesomeEffects
//
//  Created by chunf on 2019/8/28.
//  Copyright © 2019 chunf. All rights reserved.
//

#import "AlipayHomeNavigationLeftView.h"

@implementation AlipayHomeNavigationLeftView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSArray *images = @[@"scan",@"payment",@"collect"];
        NSInteger count = 3;
        CGFloat h = self.height;
        CGFloat w = self.width / count;
        CGFloat y = 0;
        for (NSInteger index = 0; index < count; index ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:images[index]] forState:UIControlStateNormal];
            button.imageEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
            button.frame = CGRectMake(index * w, y, w, h);
            [self addSubview:button];
        }
    }
    return self;
}


@end
