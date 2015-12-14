//
//  TableViewCell.m
//  可伸缩Cell
//
//  Created by wishchen on 15/12/7.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

+(TableViewCell *)cell
{
    return [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil][0];
}

- (void)awakeFromNib
{
    [self.reNameButton addTarget:self action:@selector(reName) forControlEvents:UIControlEventTouchUpInside];
    [self.deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
}

-(void)reName
{
    NSLog(@"修改备注");
}

-(void)delete
{
    NSLog(@"删除");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
