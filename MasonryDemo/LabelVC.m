//
//  LabelVC.m
//  MasonryDemo
//
//  Created by chen on 2018/7/27.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import "LabelVC.h"

@interface LabelVC ()

@end

@implementation LabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Label";

    [self loadBaseUI];
}

-(void)loadBaseUI{
    
    // 上、左、右间距为10 高度为60
    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label.text = @"Masonry是一个轻量级的布局框架与更好的包装AutoLayout语法。";
    label.numberOfLines = 2;
    label.font = [UIFont fontWithName:@"heiti SC" size:15.0];

    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10);
        make.left.equalTo(10);
        make.size.equalTo(CGSizeMake(BOUNDS_WIDTH - 10*2, 60.0));
    }];
    
    
    // 上、左、右间距为10 高度为动态变化
    UILabel *label2 = [[UILabel alloc]init];
    [self.view addSubview:label2];
    label2.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label2.text = @"Masonry是一个轻量级的布局框架与更好的包装AutoLayout语法。Masonry有它自己的布局方式，描述NSLayoutConstraints使布局代码更简洁易读。Masonry支持iOS和Mac OS X。Masonry github 地址:https://github.com/SnapKit/Masonry";
    label2.font = [UIFont fontWithName:@"heiti SC" size:15.0];
    label2.numberOfLines = 0;
    label2.preferredMaxLayoutWidth = BOUNDS_WIDTH - 10*2;
    [label2 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];

    
    
    
}



@end
