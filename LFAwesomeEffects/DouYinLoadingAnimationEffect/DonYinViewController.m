//
//  DonYinViewController.m
//  LFAwesomeEffects
//
//  Created by chunf on 2019/8/28.
//  Copyright © 2019 chunf. All rights reserved.
//

#import "DonYinViewController.h"

@interface DonYinViewController ()

@property (nonatomic, strong) UIView *loadingView;
@property (nonatomic, strong) CAAnimationGroup *animationGroup;

@end

@implementation DonYinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.image = [UIImage imageNamed:@"douYinBg"];
    [self.view addSubview:bgImageView];
    
    UIView *loadingView = [[UIView alloc] init];
    loadingView.size = CGSizeMake(1, 1);
    loadingView.center = CGPointMake(self.view.centerX, self.view.centerY - 20);
    loadingView.backgroundColor = [UIColor whiteColor];
    [loadingView setHidden:YES];
    self.loadingView = loadingView;
    [self.view addSubview:loadingView];
    
    UIButton *playOrPaulseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playOrPaulseBtn.size = CGSizeMake(100, 40);
    playOrPaulseBtn.center = CGPointMake(self.view.centerX, self.view.centerY + 20);
    [playOrPaulseBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [playOrPaulseBtn setTitle:@"播放" forState:UIControlStateNormal];
    [playOrPaulseBtn setTitle:@"暂停" forState:UIControlStateSelected];
    [playOrPaulseBtn addTarget:self action:@selector(playOrPauseAnimator:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playOrPaulseBtn];
}

- (void)playOrPauseAnimator:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self beginAnimation:YES];
    }else {
        [self beginAnimation:NO];
    }
}

- (void)beginAnimation:(BOOL)animate {
    
    if (animate) {
        [self.loadingView setHidden:NO];
        
        if (!self.animationGroup) {
            CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc]init];
            animationGroup.duration = 0.5;
            animationGroup.beginTime = CACurrentMediaTime();
            animationGroup.repeatCount = MAXFLOAT;
            animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            
            CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
            scaleAnimation.keyPath = @"transform.scale.x";
            scaleAnimation.fromValue = @(1.0f);
            scaleAnimation.toValue = @(1.0f * self.view.width - 40);
            
            CABasicAnimation *alphaAnimation = [CABasicAnimation animation];
            alphaAnimation.keyPath = @"opacity";
            alphaAnimation.fromValue = @(1.0f);
            alphaAnimation.toValue = @(0.5f);
            [animationGroup setAnimations:@[scaleAnimation, alphaAnimation]];
            self.animationGroup = animationGroup;
        }
        [self.loadingView.layer addAnimation:self.animationGroup forKey:nil];
    }else {
        [self.loadingView.layer removeAllAnimations];
        [self.loadingView setHidden:YES];
    }
}



@end
