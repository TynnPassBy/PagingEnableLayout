//
//  PagingEnableLayout.m
//  CollectionViewPagingEnable
//
//  Created by Ray on 2018/7/17.
//  Copyright © 2018年 com.collectionView.pagingEnable. All rights reserved.
//

#import "PagingEnableLayout.h"
#import <objc/message.h>

@implementation PagingEnableLayout

- (void)prepareLayout{
    [super prepareLayout];
    
    CGFloat pageInset;
    CGSize  interpageSize;
    CGPoint pagingOrigin;
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        pageInset = self.collectionView.bounds.size.height - round(self.itemSize.height);
        
        self.collectionView.contentInset = UIEdgeInsetsMake(self.headMargin, 0, pageInset * 0.5 + self.headMargin, 0);
        
        interpageSize = CGSizeMake(0, -(pageInset-self.minimumLineSpacing));
        
        pagingOrigin = CGPointMake(0, -self.headMargin);
        
    }else{
        pageInset = self.collectionView.bounds.size.width - round(self.itemSize.width);
        
        self.collectionView.contentInset = UIEdgeInsetsMake(0, self.headMargin, 0, pageInset * 0.5 + self.headMargin);
        
        interpageSize = CGSizeMake(-(pageInset-self.minimumLineSpacing), 0);
        
        pagingOrigin = CGPointMake(-self.headMargin, 0);
    }
    
    if ([self.collectionView respondsToSelector:NSSelectorFromString(@"_setInterpageSpacing:")]) {
        ((void(*)(id,SEL,CGSize))objc_msgSend)(self.collectionView,NSSelectorFromString(@"_setInterpageSpacing:"),interpageSize);
    }
    
    if ([self.collectionView      respondsToSelector:NSSelectorFromString(@"_setPagingOrigin:")]) {
        ((void(*)(id,SEL,CGPoint))objc_msgSend)(self.collectionView,NSSelectorFromString(@"_setPagingOrigin:"),pagingOrigin);
    }
}

@end
