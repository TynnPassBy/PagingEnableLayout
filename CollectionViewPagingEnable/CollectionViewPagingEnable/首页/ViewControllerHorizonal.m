//
//  ViewControllerHorizonal.m
//  CollectionViewPagingEnable
//
//  Created by TynnPassBy on 2019/6/6.
//  Copyright © 2019 com.collectionView.pagingEnable. All rights reserved.
//

#import "ViewControllerHorizonal.h"
#import "PagingEnableLayout.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define NavigetionBarHeight (44 + kStatusBarHeight)

@interface ViewControllerHorizonal ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *listCollectionView;

@end

@implementation ViewControllerHorizonal

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //水平方向滚动的collectionView布局
    
    self.title = @"向右滚动";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.listCollectionView];
}

- (UICollectionView *)listCollectionView {
    
    if (!_listCollectionView) {
        
        //1.自定义item的宽高
        CGFloat itemHeight = 230.f;
        CGFloat itemWidth = 200;
        
        //2.创建布局
        PagingEnableLayout *layout = [[PagingEnableLayout alloc] init];
        //设置第一个item距离collecitonView头部的距离
        layout.headMargin = 50;
        //设置滚动方向为 - 水平方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //设置间距
        layout.minimumLineSpacing = 30;
        //设置item大小
        layout.itemSize = CGSizeMake(itemWidth, itemHeight);
        
        //3.初始化CollectionView,要使用frame布局
        _listCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NavigetionBarHeight + 100, ScreenW, 230) collectionViewLayout:layout];
        _listCollectionView.backgroundColor = [UIColor whiteColor];
        _listCollectionView.dataSource = self;
        _listCollectionView.delegate = self;
        _listCollectionView.pagingEnabled = YES;
        _listCollectionView.showsHorizontalScrollIndicator = YES;
        if (@available(iOS 11.0, *)) {
            _listCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        [_listCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    }
    return _listCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}

@end
