//
//  WebviewProgressLayer.m
//  WebViewProgressBar
//
//  Created by chunf on 2019/7/26.
//  Copyright © 2019 chunf. All rights reserved.
//

#import "WebviewProgressLayer.h"

static NSTimeInterval const defaultDuration = 5;

@implementation WebviewProgressLayer


- (instancetype)initWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint andLineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth
{
    if (self = [super init]) {
        [self setupLineWithStartPoint:startPoint endPoint:endPoint andLineColor:lineColor lineWidth:lineWidth];
    }
    return self;
}

- (void)setupLineWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint andLineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth {
    self.lineWidth = lineWidth;
    self.strokeColor = lineColor.CGColor;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    self.path = path.CGPath;
    self.strokeEnd = .0f;
}

- (void)startAnimation {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    anim.values = @[@.0f,@0.7f,@0.8f,@0.9f];
    anim.keyTimes = @[@.0f,@0.25f,@0.5f,@1.0f];
    anim.duration = self.durationForAnimation ? self.durationForAnimation : defaultDuration;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    [self addAnimation:anim forKey:nil];
}

- (void)stopAnimation {
    self.strokeEnd = 1.0f;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperlayer];
    });
}

@end
