//
//  MyHeadView.h
//  可伸缩Cell
//
//  Created by wishchen on 15/12/7.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyHeadView;

@protocol MyHeadViewDelegate <NSObject>

- (void)selectedWith:(MyHeadView *)view;

@end

@interface MyHeadView : UIView

//中间的点击按钮
@property (strong, nonatomic) UIButton *button;
//
@property (weak, nonatomic) id<MyHeadViewDelegate> delegate;
//cell是否展开
@property (nonatomic) BOOL isOpen;
//选中的section
@property (nonatomic) NSInteger section;

+(MyHeadView *)view;

@end
