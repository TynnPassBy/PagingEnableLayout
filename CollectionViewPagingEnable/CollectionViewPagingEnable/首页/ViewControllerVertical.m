//
//  ViewControllerVertical.m
//  CollectionViewPagingEnable
//
//  Created by TynnPassBy on 2019/6/6.
//  Copyright © 2019 com.collectionView.pagingEnable. All rights reserved.
//

#import "ViewControllerVertical.h"
#import "PagingEnableLayout.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define NavigetionBarHeight (44 + kStatusBarHeight)

@interface ViewControllerVertical ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *listCollectionView;

@end

@implementation ViewControllerVertical

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //垂直方向滚动的collectionView布局
    
    self.title = @"向上滚动";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.listCollectionView];
}

- (UICollectionView *)listCollectionView {
    
    if (!_listCollectionView) {
        //1.自定义item的宽高
        CGFloat itemHeight = ScreenH - NavigetionBarHeight - 200;
        CGFloat itemWidth  = ScreenW;
        
        //2.创建布局
        PagingEnableLayout *layout = [[PagingEnableLayout alloc] init];
        //设置第一个item距离collecitonView头部的距离
        layout.headMargin = 50;
        //设置间距
        layout.minimumLineSpacing = 60;
        //设置滚动方向为 - 垂直方向
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置item大小
        layout.itemSize = CGSizeMake(itemWidth, itemHeight);
        
        //3.初始化CollectionView,要使用frame布局
        _listCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NavigetionBarHeight, ScreenW, ScreenH - NavigetionBarHeight) collectionViewLayout:layout];
        _listCollectionView.backgroundColor = [UIColor whiteColor];
        _listCollectionView.dataSource = self;
        _listCollectionView.delegate = self;
        _listCollectionView.pagingEnabled = YES;
        _listCollectionView.showsVerticalScrollIndicator = YES;
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
