//
//  ViewController.m
//  可伸缩Cell
//
//  Created by wishchen on 15/12/6.
//  Copyright © 2015年 wishchen. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "MyHeadView.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,MyHeadViewDelegate>
//头部视图数组
@property (strong, nonatomic) NSMutableArray *headViewArray;
//
@property (strong, nonatomic) UITableView *tableView;
//选中的行
//@property (nonatomic) NSInteger selectedRow;
//选中的区
@property (nonatomic) NSInteger selectedSection;

@end

//假设的数据个数
static const NSInteger count = 5;
//假设的行高(分区头高度)
static const float rowHight = 45;
//假设的分区尾高度(为了区分每个section)
static const float footerHeight = 10;

@implementation ViewController

-(NSMutableArray *)headViewArray
{
    if (!_headViewArray)
    {
        _headViewArray = [NSMutableArray array];
        
        for (int i = 0; i < count; i++)
        {
            //从xib加载view
            MyHeadView *head = [MyHeadView viewWithrame:CGRectMake(0,0, self.view.frame.size.width, rowHight)];
            head.delegate = self;
            head.section = i;
            [_headViewArray addObject:head];
        }
    }
    return _headViewArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化选中的行
//    self.selectedRow = -1;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

#pragma mark -- UITableViewDataSource
//分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.headViewArray.count;
}
//分区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return rowHight;
}
//分区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return footerHeight;
}
//每个分区的头部视图
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headViewArray[section];
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //获取当前的headview
    MyHeadView *head = self.headViewArray[section];
    //若headview已经打开,则返回假设的行数,否则为0
    return head.isOpen ? 1 : 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyHeadView *head = self.headViewArray[indexPath.section];
    //根据是否已经打开,返回行高
    return head.isOpen ? rowHight : 0;
}
//cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell)
    {
        cell = [TableViewCell cell];
    }
    
    return cell;
}

#pragma mark -- UITablewDeleagte
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    self.selectedRow = indexPath.row;
//    [self.tableView reloadData];
//}


#pragma mark - HeadViewdelegate
-(void)selectedWith:(MyHeadView *)view
{
//    self.selectedRow = -1;
    //判断下边是否显示
    if (view.isOpen)//再次点击同一个箭头button
    {
        //重置所有headview
        for(int i = 0 ; i < self.headViewArray.count ; i++)
        {
            MyHeadView *head = self.headViewArray[i];
            head.isOpen = NO;
            [head.button setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        }
        
        [self.tableView reloadData];
    }
    else//如果原先不是打开状态
    {
        self.selectedSection = view.section;
        [self reset];
    }
   
    
}

//设置界面
- (void)reset
{
    for(int i = 0 ; i < self.headViewArray.count ; i++)
    {
        MyHeadView *head = self.headViewArray[i];
        
        //设置选中的section
        if(head.section == self.selectedSection)
        {
            head.isOpen = YES;
            [head.button setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
            
        }else  //重置非选中的section
        {
            [head.button setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
            
            head.isOpen = NO;
        }
        
    }
    //刷新界面
    [self.tableView reloadData];
}


@end
