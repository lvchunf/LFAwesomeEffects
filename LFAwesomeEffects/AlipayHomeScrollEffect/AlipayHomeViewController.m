//
//  AlipayHomeViewController.m
//  LFAwesomeEffects
//
//  Created by chunf on 2019/8/28.
//  Copyright © 2019 chunf. All rights reserved.
//

#import "AlipayHomeViewController.h"
#import "AlipayHomeHeadView.h"
#import "AlipayHomeNavigationLeftView.h"
#import <MJRefresh/MJRefresh.h>

#define kHeaderHeight 100.f

static  NSString* const systemCellId = @"UITableViewCell";

@interface AlipayHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AlipayHomeHeadView *headView;
@property (nonatomic, strong) AlipayHomeNavigationLeftView *navigationLeftView;

@end

@implementation AlipayHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 修改导航栏样式
    self.navigationController.navigationBar.barTintColor = UIColorHex(3468CE);
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.navigationLeftView];
    self.navigationItem.leftBarButtonItem = item;
    
    //tableView
    [self.view addSubview:({
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - topHeight) style:UITableViewStylePlain];
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:systemCellId];
        _tableView;
    })];
    
    //tableHeadView
    UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.width, kHeaderHeight)];
    [tableHeadView addSubview:({
        _headView = [[AlipayHomeHeadView alloc] initWithFrame:tableHeadView.bounds];
        _headView;
    })];
    _tableView.tableHeaderView = tableHeadView;
    
    // 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        sleep(1.5);
        [self.tableView.mj_header endRefreshing];
    }];
    self.tableView.mj_header.ignoredScrollViewContentInsetTop = -kHeaderHeight;
}

#pragma mark ---UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:systemCellId];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行，点击返回",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController popViewControllerAnimated:YES];
}

// 滚动效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"contentoffsetY===%.1f",offsetY);
    
    [self handleHeadviewScrollEffect:offsetY];
    
    [self handleNavigationLeftViewScrolleEffect:offsetY];
}

- (void)handleHeadviewScrollEffect:(CGFloat)offsetY {
    if (offsetY < 0) {
        //向下滚动头部不动的效果
        self.headView.top = offsetY;
    }else {
        //向上滚动缩进效果
        self.headView.top = offsetY * 0.5;
    }
    // 处理渐变效果
    CGFloat alpha = 0;
    if (offsetY > 70) {
        alpha = 0;
    } else if (offsetY > 20) {
        alpha = (70 - offsetY) / 50;
    } else {
        alpha = 1;
    }
    
    for (UIView *subview in self.headView.subviews) {
        subview.alpha = alpha;
    }
    
    //也可使用layer.maskToBounds
    self.tableView.tableHeaderView.clipsToBounds = offsetY > 0;
}

- (void)handleNavigationLeftViewScrolleEffect:(CGFloat)offsetY {
    self.navigationLeftView.hidden = offsetY < 50;
    if (offsetY > kHeaderHeight) {
        self.navigationLeftView.alpha = 1;
    } else if (offsetY > 50) {
        self.navigationLeftView.alpha = 1 - (kHeaderHeight - offsetY) / 50.f;
    }
}

- (AlipayHomeNavigationLeftView *)navigationLeftView {
    if (!_navigationLeftView) {
        _navigationLeftView = [[AlipayHomeNavigationLeftView alloc] initWithFrame:CGRectMake(0, 0, 120.f, 40.f)];
        _navigationLeftView.hidden = YES;
    }
    return _navigationLeftView;
}


@end
