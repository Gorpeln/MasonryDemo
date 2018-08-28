//
//  TableVC.m
//  MasonryDemo
//
//  Created by chen on 2018/7/30.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import "TableVC.h"
#import "TableViewCell.h"
#import "TableViewModel.h"


static NSString *const identifierTableCell = @"TableViewCell";

@interface TableVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic , strong)  UITableView *mainTableView;
@property (nonatomic , strong)  NSMutableArray  *dataArray;


@end

@implementation TableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"朋友圈";
    
    [self loadBaseUI];
    
    
}

#pragma mark - 视图

- (void)loadBaseUI{
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewModel *tableViewModel = self.dataArray[indexPath.row];
    CGFloat cellHeight = tableViewModel.cellHeight;
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifierTableCell];
    if (cell == nil){
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierTableCell];
    }
    cell.indexPath = indexPath;
    cell.tableViewModel = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    __weak typeof(self) weakSelf = self;
    if (!cell.moreBtnClickedBlock) {
        [cell setMoreBtnClickedBlock:^(NSIndexPath *indexPath) {
            TableViewModel *tableViewModel = weakSelf.dataArray[indexPath.row];
            tableViewModel.isOpening = !tableViewModel.isOpening;
            [UIView performWithoutAnimation:^{
                [weakSelf.mainTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"%ld",indexPath.row);
}

- (UITableView *)mainTableView{
    if (!_mainTableView){
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_mainTableView];
        _mainTableView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

#pragma mark --   加载数据
- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TimeLine.plist" ofType:nil]];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            TableViewModel *tableViewModel = [[TableViewModel alloc] init];
            [tableViewModel encodeFromDic:dict];
            NSString *string = [dict[@"pictureArray"] componentsJoinedByString:@","];
            tableViewModel.pictureArrayStr = string;
            [tempArray addObject:tableViewModel];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}



@end
