//
//  TableViewCell.h
//  MasonryDemo
//
//  Created by chen on 2018/7/30.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewModel.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) TableViewModel *tableViewModel;
@property (nonatomic, copy) void (^moreBtnClickedBlock)(NSIndexPath *indexPath);
@property (nonatomic, strong) NSIndexPath *indexPath;


@end
