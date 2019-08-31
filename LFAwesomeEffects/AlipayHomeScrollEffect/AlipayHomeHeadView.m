//
//  AlipayHomeHeadView.m
//  LFAwesomeEffects
//
//  Created by chunf on 2019/8/28.
//  Copyright © 2019 chunf. All rights reserved.
//

#import "AlipayHomeHeadView.h"
#import "UIButton+LXMImagePosition.h"


@implementation AlipayHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorHex(3468CE);
        [self setupChildViews];
    }
    return self;
}

- (void)setupChildViews {
    NSArray *titles= @[@"扫一扫",@"付钱",@"收钱",@"手机"];
    NSArray *images= @[@"scan",@"payment",@"collect",@"phone"];
    int count = (int)titles.count;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height;
    
    for (int i = 0 ; i < count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setImagePosition:LXMImagePositionTop spacing:5];
        [self addSubview:btn];
    }
}
@end
