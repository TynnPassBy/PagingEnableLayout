//
//  TableViewController.m
//  CollectionViewPagingEnable
//
//  Created by 刘庆贺 on 2019/6/6.
//  Copyright © 2019 com.collectionView.pagingEnable. All rights reserved.
//

#import "TableViewController.h"
#import "ViewControllerVertical.h"
#import "ViewControllerHorizonal.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    self.tableView.rowHeight = 100;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"垂直滚动collectionView";
    }else{
        cell.textLabel.text = @"水平滚动collectionView";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        //垂直滚动的colleciotnView
        ViewControllerVertical *verticalVC = [[ViewControllerVertical alloc]init];
        [self.navigationController pushViewController:verticalVC animated:YES];
        
    }else{
        
        //水平滚动的colleciotnView
        ViewControllerHorizonal *verticalVC = [[ViewControllerHorizonal alloc]init];
        [self.navigationController pushViewController:verticalVC animated:YES];
        
    }
    
}

@end
