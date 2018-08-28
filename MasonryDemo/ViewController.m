//
//  ViewController.m
//  MasonryDemo
//
//  Created by chen on 2018/7/27.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import "ViewController.h"
#import "LabelVC.h"
#import "ViewVC.h"
#import "AnimationVC.h"
#import "TableVC.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *demoTitleArray;
@property (nonatomic, strong) NSArray *VCArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry";

    [self loadTableView];
}

- (NSArray *)demoTitleArray{
    if (!_demoTitleArray){
        _demoTitleArray = [NSArray arrayWithObjects:@"label视图",@"view视图", @"animation视图",@"tableView视图", nil];
    }
    return _demoTitleArray;
}

- (NSArray *)VCArray{
    if (!_VCArray){
        _VCArray = [NSArray arrayWithObjects:[LabelVC class],[ViewVC class], [AnimationVC class], [TableVC class], nil];
    }
    return _VCArray;
}

#pragma mark -
#pragma mark -- TableViewDelegate
-(void)loadTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = YES;
    _tableView.userInteractionEnabled = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.demoTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndertifier=@"cellIndertifier";
    UITableViewCell *tableViewCell=[tableView dequeueReusableCellWithIdentifier:cellIndertifier];
    if (!tableViewCell) {
        tableViewCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndertifier];
    }
    tableViewCell.textLabel.text = self.demoTitleArray[indexPath.row];
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;

    return tableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"您点击了第 %ld 个单元格",(long)indexPath.row);
    Class class = self.VCArray[indexPath.row];
    ViewController *controller = [[class alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}


@end
