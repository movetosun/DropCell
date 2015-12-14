//
//  TableViewCell.h
//  可伸缩Cell
//
//  Created by wishchen on 15/12/7.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

//修改备注
@property (weak, nonatomic) IBOutlet UIButton *reNameButton;
//删除
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

+(TableViewCell *)cell;

@end
