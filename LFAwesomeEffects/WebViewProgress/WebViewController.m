//
//  WebViewController.m
//  LFAwesomeEffects
//
//  Created by chunf on 2019/8/31.
//  Copyright © 2019 chunf. All rights reserved.
//

#import "WebViewController.h"
#import "WebviewProgressLayer.h"

@interface WebViewController ()

@property (nonatomic, strong) WebviewProgressLayer *webLayer;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    WebviewProgressLayer *webLayer = [[WebviewProgressLayer alloc] initWithStartPoint:CGPointMake(5, 100) endPoint:CGPointMake(screenW - 5 * 2, 100) andLineColor:[UIColor redColor] lineWidth:2];
    [self.view.layer addSublayer:webLayer];
    self.webLayer = webLayer;
    
    UIButton *startOrStopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startOrStopBtn.size = CGSizeMake(120, 40);
    startOrStopBtn.centerX = self.view.centerX;
    startOrStopBtn.top = 200;
    [startOrStopBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [startOrStopBtn setTitle:@"开始动画" forState:UIControlStateNormal];
    [startOrStopBtn setTitle:@"移除动画" forState:UIControlStateSelected];
    [startOrStopBtn addTarget:self action:@selector(startOrStopBtnAnimator:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startOrStopBtn];
}

- (void)startOrStopBtnAnimator:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        if (![self.view.layer.sublayers containsObject:self.webLayer]) {
            [self.view.layer addSublayer:self.webLayer];
        }
        [self.webLayer startAnimation];
    }else {
        [self.webLayer stopAnimation];
    }
}

@end
