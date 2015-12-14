//
//  MyHeadView.m
//  可伸缩Cell
//
//  Created by wishchen on 15/12/7.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import "MyHeadView.h"

@implementation MyHeadView

+(MyHeadView *)view
{
    MyHeadView *view = [[MyHeadView alloc]init];
    
    return view;
}

-(instancetype)init
{
    if (self = [super init])
    {
#warning 所有要添加的控件都在init方法内添加好,并且做好布局,需要外界/改变的,在.H文件内声明为属性,
        self.button = [[UIButton alloc]init];
        self.button.bounds = CGRectMake(0, 0, 20, 20);
        self.button.center = self.center;
        self.button.backgroundColor = [UIColor redColor];
        
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
