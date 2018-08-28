//
//  ViewVC.m
//  MasonryDemo
//
//  Created by chen on 2018/7/27.
//  Copyright © 2018年 Gorpeln. All rights reserved.
//

#import "ViewVC.h"

@interface ViewVC ()

@end

@implementation ViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"view";

    [self loadBaseUI];

}

-(void)loadBaseUI{
    
    // 横向居中，大小50 * 50
    UIView *viewOne = [[UIView alloc]init];
    [self.view addSubview:viewOne];
    viewOne.backgroundColor =[UIColor grayColor];
    
    [viewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10);
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    
    // 让2个高度为50的view等宽且等间隔排列，间隔为10(自动计算其宽度)
    UIView *viewTwo = [[UIView alloc]init];
    [self.view addSubview:viewTwo];
    viewTwo.backgroundColor = [UIColor redColor];
    
    UIView *viewThree = [[UIView alloc]init];
    [self.view addSubview:viewThree];
    viewThree.backgroundColor = [UIColor blueColor];
    
    [viewTwo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewOne.mas_bottom).offset(10);
        make.left.equalTo(10);
        make.right.equalTo(viewThree.mas_left).offset(-10);
        make.height.equalTo(50);
        make.width.equalTo(viewThree);

    }];
    [viewThree makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewTwo);
        make.left.equalTo(viewTwo.mas_right).offset(10);
        make.right.equalTo(-10);
        make.height.equalTo(50);
        make.width.equalTo(viewTwo);
    }];
    
    
    // 随尺寸变化
    UIView *viewFour = [[UIView alloc]init];
    [self.view addSubview:viewFour];
    viewFour.backgroundColor = [UIColor greenColor];
    
    [viewFour makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewTwo.mas_bottom).offset(10.0);
        make.left.equalTo(10.0);
        make.right.equalTo(viewThree.mas_left).with.offset(-10.0);
        make.height.equalTo(self.view.mas_width).multipliedBy(0.5);
    }];
    
    
    
    
    
}



@end
