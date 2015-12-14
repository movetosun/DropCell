//
//  MyHeadView.m
//  可伸缩Cell
//
//  Created by wishchen on 15/12/7.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import "MyHeadView.h"

@implementation MyHeadView

+(MyHeadView *)viewWithrame:(CGRect)frame
{
    MyHeadView *view = [[MyHeadView alloc]initWithFrame:frame];
    
    return view;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor lightGrayColor];
        self.button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
        self.button.center = self.center;
        self.button.backgroundColor = [UIColor redColor];
        [self.button setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button];
    }
    return self;
}
- (void)buttonClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedWith:)])
    {
        [self.delegate selectedWith:self];
    }
}



@end
