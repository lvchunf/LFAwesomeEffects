//
//  ViewController.m
//  LFAwesomeEffects
//
//  Created by chunf on 2019/8/27.
//  Copyright © 2019 chunf. All rights reserved.
//

#import "ViewController.h"
#import "AlipayHomeViewController.h"
#import "DonYinViewController.h"




@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIImage *shadowImage;

@end

static  NSString* const systemCellId = @"UITableViewCell";

@implementation ViewController

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithObjects:@"支付宝首页滚动效果",@"抖音加载动画效果", nil];
    }
    return _dataArr;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = nil;
    self.navigationController.navigationBar.shadowImage = self.shadowImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shadowImage = self.navigationController.navigationBar.shadowImage;

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:systemCellId];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:systemCellId forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            AlipayHomeViewController *alipayVC = [AlipayHomeViewController new];
            [self.navigationController pushViewController:alipayVC animated:YES];
            break;
        }
        case 1: {
            DonYinViewController *donYinVC = [DonYinViewController new];
            [self.navigationController pushViewController:donYinVC animated:YES];
            break;
        }
        default:
            break;
    }
   
}




@end
