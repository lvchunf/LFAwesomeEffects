//
//  WebviewProgressLayer.h
//  WebViewProgressBar
//
//  Created by chunf on 2019/7/26.
//  Copyright © 2019 chunf. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebviewProgressLayer : CAShapeLayer

- (instancetype)initWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint andLineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth NS_DESIGNATED_INITIALIZER;

- (void)startAnimation;

- (void)stopAnimation;

@property (nonatomic, assign) NSTimeInterval durationForAnimation;
@end

NS_ASSUME_NONNULL_END
